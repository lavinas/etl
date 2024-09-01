package usecase

import (
	"fmt"
	"os"
	"sort"
	"strconv"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

// Mount is the usecase for the mount base operation
type SetUp struct {
	Base
}

// NewMount creates a new mount usecase
func NewSetUp(repoSource port.Repository, repoTarget port.Repository, signal chan os.Signal) *SetUp {
	return &SetUp{
		Base: Base{
			RepoSource: repoSource,
			RepoTarget: repoTarget,
			Signal:     signal,
		},
	}
}

// ForeignColumn represents a foreign key column
type SetUpForeign struct {
	ColumnName       string
	ReferencedSchema string
	ReferencedTable  string
	ReferencedColumn string
	ReferencedID     int64
}

// SetUpKey represents a key of node
type SetUpKey struct {
	Object    string
	Field     string
	InitValue int64
}

// SetUpNode is the input for the SetUp usecase
type SetUpNode struct {
	Id          int64
	TableSchema string
	TableName   string
	RefType     string
	Primaries   map[string]*SetUpKey
	Foreigns    map[string]*SetUpForeign
}

// GraphNode represents a node in the graph used to order the tables
type GraphNode struct {
	node *SetUpNode
	next map[string]*GraphNode
}

// Run runs the mount operation
func (m *SetUp) Run(in *port.SetUpIn, out chan *port.SetUpOut) {
	defer func() {
		out <- &port.SetUpOut{Status: port.FinishedStatus}
	}()
	if in == nil || out == nil {
		out <- &port.SetUpOut{Status: port.ErrorStatus, Detail: port.ErrRepoNilObject}
	}
	nodes, stack, err := m.prepareRun(in)
	if err != nil {
		out <- &port.SetUpOut{Status: port.ErrorStatus, Detail: err.Error()}
		return
	}
	err = m.runAction(in.Action, nodes, stack, out)
	if err != nil {
		out <- &port.SetUpOut{Status: port.ErrorStatus, Detail: err.Error()}
		return
	}
	out <- &port.SetUpOut{Status: port.SuccessStatus, Detail: "Success"}
}

// prepareRun prepares the run action
func (m *SetUp) prepareRun(in *port.SetUpIn) (map[string]*SetUpNode, *GraphNode, error) {
	txSource := m.RepoSource.Begin("")
	defer m.RepoSource.Rollback(txSource)
	txTarget := m.RepoTarget.Begin("")
	defer m.RepoTarget.Rollback(txTarget)
	nodes, err := m.mountStructs(in, txSource, txTarget)
	if err != nil {
		return nil, nil, err
	}
	stack, err := m.makeGraph(nodes)
	if err != nil {
		return nil, nil, err
	}
	return nodes, stack, nil
}

// factoryAction runs the action
func (m *SetUp) runAction(action string, nodes map[string]*SetUpNode, stack *GraphNode, out chan *port.SetUpOut) error {
	var err error
	switch action {
	case "check":
		m.runCheck(stack, out)
	case "setup":
		err = m.runSetup(nodes, stack)
	default:
		err = fmt.Errorf(port.ErrActionNotFound)
	}
	return err
}

// runSetup runs the setup action
func (m *SetUp) runSetup(nodes map[string]*SetUpNode, stack *GraphNode) error {
	txTarget := m.RepoTarget.Begin("")
	defer m.RepoTarget.Rollback(txTarget)
	if err := m.setId(nodes, stack); err != nil {
		return err
	}
	if err := m.saveStructs(nodes, txTarget); err != nil {
		return err
	}
	return nil
}

// run

// runCheck runs the check action
func (m *SetUp) runCheck(stack *GraphNode, out chan *port.SetUpOut) {
	mp := m.getMap(stack)
	for _, m := range mp {
		out <- &port.SetUpOut{Status: "", Detail: m}
	}
}

// mountStructs returns the structs of the given schema
func (m *SetUp) mountStructs(in *port.SetUpIn, txSource interface{}, txTarget interface{}) (map[string]*SetUpNode, error) {
	schemas, err := m.getSchemas(in.Schema, txTarget)
	if err != nil {
		return nil, err
	}
	nodes, err := m.getNodes(schemas, txSource)
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, fmt.Errorf(port.ErrNoTablesFound)
	}
	if err := m.getPrimaries(schemas, nodes, txSource); err != nil {
		return nil, err
	}
	if err := m.getForeigns(schemas, nodes, txTarget); err != nil {
		return nil, err
	}
	return nodes, nil
}

// getTables returns the tables of the given schema
func (m *SetUp) getNodes(schemas map[string]string, tx interface{}) (map[string]*SetUpNode, error) {
	if len(schemas) == 0 {
		return nil, fmt.Errorf(port.ErrSetupSchemaEmpty)
	}
	expts, err := m.mountExceptions()
	if err != nil {
		return nil, err
	}
	query := fmt.Sprintf(port.SetUpSelectTables, m.mountSchemas(schemas), expts)
	_, rows, err := m.RepoSource.Query(tx, query)
	if err != nil {
		return nil, err
	}
	nodes := make(map[string]*SetUpNode, len(rows))
	for _, row := range rows {
		nodes[*row[1]] = &SetUpNode{
			TableSchema: *row[0],
			TableName:   *row[1],
			RefType:     schemas[*row[0]],
			Primaries:   make(map[string]*SetUpKey),
			Foreigns:    make(map[string]*SetUpForeign),
		}
	}
	return nodes, nil
}

// getSchemas returns the schemas of the given database
func (m *SetUp) getSchemas(schema string, tx interface{}) (map[string]string, error) {
	name := ""
	aux := "true"
	if schema != "" {
		name = schema
		aux = "false"
	}
	q := fmt.Sprintf(port.SetUpSchemas, name, aux)
	_, rows, err := m.RepoTarget.Query(tx, q)
	if err != nil {
		return nil, err
	}
	if len(rows) == 0 {
		return nil, fmt.Errorf(port.ErrNoSchemasFound)
	}
	schemas := make(map[string]string, len(rows))
	for _, row := range rows {
		schemas[*row[0]] = *row[1]
	}
	return schemas, nil
}

// mountSchemas returns the string representation of the schemas
func (m *SetUp) mountSchemas(schemas map[string]string) string {
	ret := ""
	for k := range schemas {
		ret += "'" + k + "',"
	}
	return ret[:len(ret)-1]
}

// getPrimaries returns the primary keys of the given nodes
func (m *SetUp) getPrimaries(schemas map[string]string, nodes map[string]*SetUpNode, tx interface{}) error {
	rows, err := m.getPrimariesTable(schemas, nodes, tx)
	if err != nil {
		return err
	}
	kmap, err := m.getPrimariesPre()
	if err != nil {
		return err
	}
	for _, row := range rows {
		if k, ok := kmap[*row[0]+"-"+*row[1]]; ok {
			nodes[*row[0]].Primaries[*row[1]] = k
		} else {
			nodes[*row[0]].Primaries[*row[1]] = &SetUpKey{Object: *row[0], Field: *row[1], InitValue: -1}
		}
	}
	return nil
}

// getPrimariesTable returns a map of primaries of db table
func (m *SetUp) getPrimariesTable(schemas map[string]string, nodes map[string]*SetUpNode, tx interface{}) ([][]*string, error) {
	tableNames := ""
	for _, table := range nodes {
		tableNames += "'" + table.TableName + "',"
	}
	q := fmt.Sprintf(port.SetUpSelectPrime, m.mountSchemas(schemas), tableNames[:len(tableNames)-1])
	_, rows, err := m.RepoSource.Query(tx, q)
	if err != nil {
		return nil, err
	}
	return rows, nil
}

// getPrimariesPre returns a pre configured map of Primeries struct
func (m *SetUp) getPrimariesPre() (map[string]*SetUpKey, error) {
	tx := m.RepoTarget.Begin("")
	defer m.RepoTarget.Rollback(tx)
	_, keys, err := m.RepoTarget.Query(tx, port.SetUpKey)
	if err != nil {
		return nil, err
	}
	kmap := make(map[string]*SetUpKey)
	for _, k := range keys {
		i, _ := strconv.ParseInt(*k[2], 10, 64)
		kmap[*k[0]+"-"+*k[1]] = &SetUpKey{Object: *k[0], Field: *k[1], InitValue: i}
	}
	return kmap, nil
}

// getForeigns returns the foreign keys of the given nodes
func (m *SetUp) getForeigns(schemas map[string]string, nodes map[string]*SetUpNode, tx interface{}) error {
	schema := m.mountSchemas(schemas)
	external, internal := m.getTableNames(nodes)
	rows := make([][]*string, 0)
	if external != "" {
		query := fmt.Sprintf(port.SetUpSelectForeignExternal, schema, external)
		_, r, err := m.RepoTarget.Query(tx, query)
		if err != nil {
			return err
		}
		rows = append(rows, r...)
	}
	if internal != "" {
		query := fmt.Sprintf(port.SetUpSelectForeignInternal, schema, internal)
		_, r, err := m.RepoTarget.Query(tx, query)
		if err != nil {
			return err
		}
		rows = append(rows, r...)
	}
	for _, row := range rows {
		if *row[3] == *row[0] {
			continue
		}
		nodes[*row[0]].Foreigns[*row[3]] = &SetUpForeign{
			ColumnName:       *row[1],
			ReferencedSchema: *row[2],
			ReferencedTable:  *row[3],
			ReferencedColumn: *row[4],
		}
	}
	return nil
}

// separateTables separates the tables by the foreign keys
func (m *SetUp) getTableNames(nodes map[string]*SetUpNode) (string, string) {
	external := ""
	internal := ""
	for _, node := range nodes {
		if node.RefType == "external" {
			external += "'" + node.TableName + "',"
		} else {
			internal += "'" + node.TableName + "',"
		}
	}
	if external != "" {
		external = external[:len(external)-1]
	}
	if internal != "" {
		internal = internal[:len(internal)-1]
	}
	return external, internal
}

// getOrdered returns the tables ordered by the foreign keys
func (m *SetUp) setId(nodes map[string]*SetUpNode, stack *GraphNode) error {
	ordered := make(map[string]int64, 0)
	m.orderGraph(stack, ordered, 0)
	order := make([]string, 0)
	for k := range ordered {
		order = append(order, k)
	}
	sort.Slice(order, func(i, j int) bool { return ordered[order[i]] > ordered[order[j]] })
	for i, o := range order {
		if nodes[o].Id < int64(i+1) {
			nodes[o].Id = int64(i + 1)
		}
	}
	m.setForwardId(stack)
	return nil
}

// checkGraph checks the graph for circular references
func (m *SetUp) checkGraph(stack *GraphNode) error {
	for name, node := range stack.next {
		circ := make(map[string]bool)
		if err := m.checkNode(name, node, circ); err != nil {
			return err
		}
	}
	return nil
}

// checkNode checks the node for circular references
func (m *SetUp) checkNode(name string, node *GraphNode, circ map[string]bool) error {
	if node.node == nil {
		return fmt.Errorf(port.ErrTableReferceNotFound, name)
	}
	if _, ok := circ[name]; ok {
		return fmt.Errorf(port.ErrCircularReference, name)
	}
	circ[name] = true
	for name, node := range node.next {
		if err := m.checkNode(name, node, circ); err != nil {
			return err
		}
	}
	delete(circ, name)
	return nil
}

// printNode prints the node structure
func (m *SetUp) getMap(graph *GraphNode) []string {
	ret := make([]string, 0)
	for name, node := range graph.next {
		n := m.getMap(node)
		if len(n) == 0 {
			ret = append(ret, name)
		}
		for _, nn := range n {
			ret = append(ret, name+"->"+nn)
		}
	}
	return ret
}

// setForwardId sets the forward id of the nodes
func (m *SetUp) setForwardId(graphNode *GraphNode) {
	for _, node := range graphNode.next {
		if graphNode.node != nil {
			graphNode.node.Foreigns[node.node.TableName].ReferencedID = node.node.Id
		}
		m.setForwardId(node)
	}
}

// makeGraph creates a graph from the nodes
func (m *SetUp) makeGraph(nodes map[string]*SetUpNode) (*GraphNode, error) {
	nodemap := make(map[string]*GraphNode, len(nodes))
	stack := &GraphNode{node: nil, next: make(map[string]*GraphNode)}
	var nd *GraphNode
	for name, node := range nodes {
		if _, ok := nodemap[name]; !ok {
			nd = &GraphNode{node: node, next: make(map[string]*GraphNode)}
			nodemap[name] = nd
			stack.next[name] = nd
		} else {
			nd = nodemap[name]
			nd.node = node
		}
		m.makeVectors(nodemap, node, nd, stack)
	}
	if err := m.checkGraph(stack); err != nil {
		return nil, err
	}
	return stack, nil
}

// kakegraphForeign creates a graph from the foreign keys
func (m *SetUp) makeVectors(nodemap map[string]*GraphNode, node *SetUpNode, nd *GraphNode, stack *GraphNode) {
	var fw *GraphNode
	for _, foreign := range node.Foreigns {
		if _, ok := nodemap[foreign.ReferencedTable]; !ok {
			fw = &GraphNode{node: nil, next: make(map[string]*GraphNode)}
			nodemap[foreign.ReferencedTable] = fw
		} else {
			fw = nodemap[foreign.ReferencedTable]
		}
		delete(stack.next, foreign.ReferencedTable)
		nd.next[foreign.ReferencedTable] = fw
	}
}

// orderGraph orders the graph
func (m *SetUp) orderGraph(graph *GraphNode, orderMap map[string]int64, i int64) {
	for name, node := range graph.next {
		if _, ok := orderMap[name]; !ok || orderMap[name] < i+1 {
			orderMap[name] = i + 1
			m.orderGraph(node, orderMap, i+1)
		}
	}
}

// mount exceptions to the query
func (m *SetUp) mountExceptions() (string, error) {
	tx := m.RepoTarget.Begin("")
	defer m.RepoTarget.Rollback(tx)
	_, rows, err := m.RepoTarget.Query(tx, port.SetUpExcepts)
	if err != nil {
		return "", err
	}
	if len(rows) == 0 {
		return "0", nil
	}
	expt := ""
	for _, row := range rows {
		expt += *row[0] + " or "
	}
	return expt[:len(expt)-4], nil
}

// saveStructs saves the structs in the target database
func (m *SetUp) saveStructs(nodes map[string]*SetUpNode, tx interface{}) error {
	if err := m.truncateStructs(tx); err != nil {
		return err
	}
	m.RepoTarget.Exec(tx, port.SetupDisableFK)
	for _, node := range nodes {
		job := domain.NewJob(node.Id, node.TableSchema+"."+node.TableName, "table", "copy", node.TableSchema, node.TableName)
		if err := job.Save(m.RepoTarget, tx); err != nil {
			return err
		}
		if err := m.savePrimaries(node, tx); err != nil {
			return err
		}
		if err := m.saveForeigns(node, tx); err != nil {
			return err
		}
	}
	m.RepoTarget.Exec(tx, port.SetupEnableFK)
	m.RepoTarget.Commit(tx)
	return nil
}

// truncateStructs truncates the structs in the target database
func (m *SetUp) truncateStructs(tx interface{}) error {
	tables := []string{"ref_key", "ref", "job_key", "job"}
	if _, err := m.RepoTarget.Exec(tx, port.SetupDisableFK); err != nil {
		return err
	}
	for _, table := range tables {
		if _, err := m.RepoTarget.Exec(tx, fmt.Sprintf(port.SetUpTruncate, table)); err != nil {
			return err
		}
	}
	if _, err := m.RepoTarget.Exec(tx, port.SetupEnableFK); err != nil {
		return err
	}
	return nil
}

// savePrimaries saves the primary keys in the target database
func (m *SetUp) savePrimaries(node *SetUpNode, tx interface{}) error {
	count := node.Id * 100
	for _, p := range node.Primaries {
		key := domain.NewJobKey(count, node.Id, p.InitValue, 5000, p.Field)
		if err := key.Save(m.RepoTarget, tx); err != nil {
			return err
		}
		count++
	}
	return nil
}

// saveForeigns saves the foreign keys in the target database
func (m *SetUp) saveForeigns(node *SetUpNode, tx interface{}) error {
	count := node.Id * 100
	for _, foreign := range node.Foreigns {
		fk := domain.NewRef(count, node.Id, foreign.ReferencedID)
		if err := fk.Save(m.RepoTarget, tx); err != nil {
			return err
		}
		kfk := domain.NewRefKey(count, count, foreign.ColumnName, foreign.ReferencedColumn)
		if err := kfk.Save(m.RepoTarget, tx); err != nil {
			return err
		}
		count++
	}
	return nil
}
