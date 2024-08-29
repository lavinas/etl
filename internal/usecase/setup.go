package usecase

import (
	"fmt"
	"os"
	"sort"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	SetupDisableFK     = "SET FOREIGN_KEY_CHECKS = 0;"
	SetupEnableFK      = "SET FOREIGN_KEY_CHECKS = 1;"
	SetUpSelectTables  = "SELECT table_schema, table_name from information_schema.tables where table_schema = '%s' and not (%s) and table_name in ('client', 'user', 'aggregator') order by 1,2;"
	SetUpSelectPrime   = "SELECT table_name, column_name FROM information_schema.columns WHERE table_schema = '%s' AND table_name in (%s) AND column_key = 'PRI';"
	// SetUpSelecrForeign = "SELECT table_name, column_name, referenced_table_schema, referenced_table_name, referenced_column_name FROM information_schema.key_column_usage WHERE table_schema = '%s' AND table_name in (%s) AND referenced_table_name is not null;"
	SetUpSelecrForeign = "SELECT referrer_table, referrer_field, referenced_schema, referenced_table, referenced_field FROM ref_init WHERE referrer_schema = '%s' AND referrer_table in (%s);"
)

var (
	SetUpSelectExcept = []string{
		"table_name like 'shellbox%'",
		"table_name like 'tmp_%'",
		"table_name like 'temp_%'",
		"table_name like 'analise%'",
		"table_name = 'mercadopago_transacao31.03'",
		"table_name = 'mercadopago_transacao31.03'",
		"table_name = 'connect_item_btg'",
		"table_name = 'group_bkp'",
		"table_name = 'rel_ant'",
		"table_name = 'sales_statement'",
		"table_name = 'stix_1405'",
		"table_name = 'transacao_btg'",
		"table_name = 'transacoes_erradas'",
		"table_name = 'transacoes_sap_08_07'",
	}
)

// ForeignColumn represents a foreign key column
type SetUpForeign struct {
	ColumnName       string
	ReferencedSchema string
	ReferencedTable  string
	ReferencedColumn string
	ReferencedID     int64
}

// SetUpNode is the input for the SetUp usecase
type SetUpNode struct {
	Id          int64
	TableSchema string
	TableName   string
	Primaries   []string
	Foreigns    map[string]*SetUpForeign
}

// GraphNode represents a node in the graph used to order the tables
type GraphNode struct {
	node *SetUpNode
	next map[string]*GraphNode
}

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

// runCheck runs the check action
func (m *SetUp) runCheck(stack *GraphNode, out chan *port.SetUpOut) {
	mp := m.getMap(stack)
	for _, m := range mp {
		out <- &port.SetUpOut{Status: "", Detail: m}
	}
}

// mountStructs returns the structs of the given schema
func (m *SetUp) mountStructs(in *port.SetUpIn, txSource interface{}, txTarget interface{}) (map[string]*SetUpNode, error) {
	nodes, err := m.getNodes(in.Schema, txSource)
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, fmt.Errorf(port.ErrNoTablesFound)
	}
	if err := m.getPrimaries(in.Schema, nodes, txSource); err != nil {
		return nil, err
	}
	if err := m.getForeigns(in.Schema, nodes, txTarget); err != nil {
		return nil, err
	}
	return nodes, nil
}

// getTables returns the tables of the given schema
func (m *SetUp) getNodes(schema string, tx interface{}) (map[string]*SetUpNode, error) {
	if schema == "" {
		return nil, fmt.Errorf(port.ErrSetupSchemaEmpty)
	}
	query := fmt.Sprintf(SetUpSelectTables, schema, m.mountExceptions())
	_, rows, err := m.RepoSource.Query(tx, query)
	if err != nil {
		return nil, err
	}
	nodes := make(map[string]*SetUpNode, len(rows))
	for _, row := range rows {
		nodes[*row[1]] = &SetUpNode{
			TableSchema: *row[0],
			TableName:   *row[1],
			Primaries:   make([]string, 0),
			Foreigns:    make(map[string]*SetUpForeign),
		}
	}
	return nodes, nil
}

// getPrimaries returns the primary keys of the given nodes
func (m *SetUp) getPrimaries(schema string, nodes map[string]*SetUpNode, tx interface{}) error {
	tableNames := ""
	for _, table := range nodes {
		tableNames += "'" + table.TableName + "',"
	}
	query := fmt.Sprintf(SetUpSelectPrime, schema, tableNames[:len(tableNames)-1])
	_, rows, err := m.RepoSource.Query(tx, query)
	if err != nil {
		return err
	}
	for _, row := range rows {
		nodes[*row[0]].Primaries = append(nodes[*row[0]].Primaries, *row[1])
	}
	return nil
}

// getForeigns returns the foreign keys of the given nodes
func (m *SetUp) getForeigns(schema string, nodes map[string]*SetUpNode, tx interface{}) error {
	tableNames := ""
	for _, table := range nodes {
		tableNames += "'" + table.TableName + "',"
	}
	query := fmt.Sprintf(SetUpSelecrForeign, schema, tableNames[:len(tableNames)-1])
	_, rows, err := m.RepoTarget.Query(tx, query)
	if err != nil {
		return err
	}
	for _, row := range rows {
		nodes[*row[0]].Foreigns[*row[3]] = &SetUpForeign{
			ColumnName:       *row[1],
			ReferencedSchema: *row[2],
			ReferencedTable:  *row[3],
			ReferencedColumn: *row[4],
		}
	}
	return nil
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
		nodes[o].Id = int64(i + 1)
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
		if _, ok := orderMap[name]; !ok {
			orderMap[name] = i + 1
			m.orderGraph(node, orderMap, i+1)
		}
	}
}

// mount exceptions to the query
func (m *SetUp) mountExceptions() string {
	if len(SetUpSelectExcept) == 0 {
		return "0"
	}
	query := ""
	for _, exception := range SetUpSelectExcept {
		query += exception + " or "
	}
	return query[:len(query)-4]
}

// saveStructs saves the structs in the target database
func (m *SetUp) saveStructs(nodes map[string]*SetUpNode, tx interface{}) error {
	m.RepoTarget.Exec(tx, SetupDisableFK)
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
	m.RepoTarget.Commit(tx)
	m.RepoTarget.Exec(tx, SetupDisableFK)
	return nil
}

// savePrimaries saves the primary keys in the target database
func (m *SetUp) savePrimaries(node *SetUpNode, tx interface{}) error {
	count := node.Id * 100
	for _, primary := range node.Primaries {
		key := domain.NewJobKey(count, node.Id, -1, 5000, primary)
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