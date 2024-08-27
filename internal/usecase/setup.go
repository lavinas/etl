package usecase

import (
	"fmt"
	"os"
	"sort"

	// "github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	SetUpSelectTables  = "SELECT table_schema, table_name from information_schema.tables where table_schema = '%s' and not (%s) order by 1,2;"
	SetUpSelectPrime   = "SELECT table_name, column_name FROM information_schema.columns WHERE table_schema = '%s' AND table_name in (%s) AND column_key = 'PRI';"
	SetUpSelecrForeign = "SELECT table_name, column_name, referenced_table_schema, referenced_table_name, referenced_column_name FROM information_schema.key_column_usage WHERE table_schema = '%s' AND table_name in (%s) AND referenced_table_name is not null;"
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
	Id           int64
	TableSchema  string
	TableName    string
	Primaries    []string
	Foreigns     []*SetUpForeign
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
	if in == nil || out == nil {
		panic("Setup: Invalid input parameters")
	}
	tx := m.RepoSource.Begin("")
	defer m.RepoSource.Rollback(tx)
	nodes, err := m.mountStructs(in, tx)
	if err != nil {
		out <- &port.SetUpOut{Status: "error", Detail: err.Error()}
		return
	}
	m.setId(nodes)
	if err := m.saveStructs(nodes, tx); err != nil {
		out <- &port.SetUpOut{Status: "error", Detail: err.Error()}
		return
	}
	out <- &port.SetUpOut{Status: "Ok", Detail: "Success"}
}

// mountStructs returns the structs of the given schema
func (m *SetUp) mountStructs(in *port.SetUpIn, tx interface{}) (map[string]*SetUpNode, error) {
	nodes, err := m.getNodes(in.Schema, tx)
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, fmt.Errorf(port.ErrNoTablesFound)
	}
	if err := m.getPrimaries(in.Schema, nodes, tx); err != nil {
		return nil, err
	}
	if err := m.getForeigns(in.Schema, nodes, tx); err != nil {
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
	_, rows, err := m.RepoSource.Query(tx, query)
	if err != nil {
		return err
	}
	for _, row := range rows {
		nodes[*row[0]].Foreigns = append(nodes[*row[0]].Foreigns, &SetUpForeign{
			ColumnName:       *row[1],
			ReferencedSchema: *row[2],
			ReferencedTable:  *row[3],
			ReferencedColumn: *row[4],
		})
	}
	return nil
}

// getOrdered returns the tables ordered by the foreign keys
func (m *SetUp) setId(nodes map[string]*SetUpNode) {
	graph := m.makeGraph(nodes)
	ordered := make(map[string]int64, 0)
	m.orderGraph(graph, ordered, 0)
	order := make([]string, 0)
	for k := range ordered {
		order = append(order, k)
	}
	sort.Slice(order, func(i, j int) bool { return ordered[order[i]] > ordered[order[j]] })
	for i, o := range order {
		nodes[o].Id = int64(i)
	}
}

// makeGraph creates a graph from the nodes
func (m *SetUp) makeGraph(nodes map[string]*SetUpNode) *GraphNode {
	nodemap := make(map[string]*GraphNode, len(nodes))
	stack := &GraphNode{node: nil, next: make(map[string]*GraphNode)}
	var nd *GraphNode
	for name, node := range nodes {
		if _, ok := nodemap[name]; !ok {
			nd = &GraphNode{node: node, next: make(map[string]*GraphNode)}
			stack.next[name] = nd
			nodemap[name] = nd
		} else {
			nd = nodemap[name]
			nd.node = node
		}
		m.makeVectors(nodemap, node, nd, stack)
	}
	return stack
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
	for _, node := range nodes {
		/*
		job := domain.NewJob(node.Id, node.TableSchema + "." + node.TableName, "table", "copy", node.TableSchema, node.TableName)
		if err := job.Save(m.RepoTarget, tx); err != nil {
			return err
		}
		count := node.Id * 100
		for _, primary := range node.Primaries {
			key := domain.NewJobKey(count, node.Id, -1, 5000, primary)
			if err := key.Save(m.RepoTarget, tx); err != nil {
				return err
			}
			count++
		}
		count = node.Id * 100
		for _, foreign := range node.Foreigns {
			fk := domain.NewRef(count, node.Id, foreign.ReferencedID)
			if err := fk.Save(m.RepoTarget, tx); err != nil {
				return err
			}
			count++
		}
		*/
		fmt.Println(node.Id, node.TableName)
	}
	fmt.Println(10000, len(nodes))
	m.RepoTarget.Commit(tx)
	return nil
}
