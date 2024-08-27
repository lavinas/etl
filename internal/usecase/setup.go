package usecase

import (
	"fmt"
	"os"

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
}

// SetUpMap is the input for the SetUp usecase
type SetUpMap struct {
	Id           int64
	TableSchema  string
	TableName    string
	Primaries    []string
	Foreigns     []*SetUpForeign
	Dependencies []*SetUpMap
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
	tables, err := m.getTables(in.Schema, tx)
	if err != nil {
		out <- &port.SetUpOut{Status: "error", Detail: err.Error()}
		return
	}
	if len(tables) == 0 {
		out <- &port.SetUpOut{Status: "error", Detail: "No tables found"}
		return
	}
	if err := m.getPrimaries(in.Schema, tables, tx); err != nil {
		out <- &port.SetUpOut{Status: "error", Detail: err.Error()}
		return
	}
	if err := m.getForeigns(in.Schema, tables, tx); err != nil {
		out <- &port.SetUpOut{Status: "error", Detail: err.Error()}
		return
	}
	order := m.getOrder(tables)

	for i, o := range order {
		fmt.Println(i, o)
	}
	out <- &port.SetUpOut{Status: "Ok", Detail: "Success"}
}

// getTables returns the tables of the given schema
func (m *SetUp) getTables(schema string, tx interface{}) (map[string]*SetUpMap, error) {
	if schema == "" {
		return nil, fmt.Errorf(port.ErrSetupSchemaEmpty)
	}
	query := fmt.Sprintf(SetUpSelectTables, schema, m.mountExceptions())
	_, rows, err := m.RepoSource.Query(tx, query)
	if err != nil {
		return nil, err
	}
	tables := make(map[string]*SetUpMap, len(rows))
	for _, row := range rows {
		tables[*row[1]] = &SetUpMap{
			TableSchema: *row[0],
			TableName:   *row[1],
		}
	}
	return tables, nil
}

// getPrimaries returns the primary keys of the given tables
func (m *SetUp) getPrimaries(schema string, tables map[string]*SetUpMap, tx interface{}) error {
	tableNames := ""
	for _, table := range tables {
		tableNames += "'" + table.TableName + "',"
	}
	query := fmt.Sprintf(SetUpSelectPrime, schema, tableNames[:len(tableNames)-1])
	_, rows, err := m.RepoSource.Query(tx, query)
	if err != nil {
		return err
	}
	for _, row := range rows {	
		tables[*row[0]].Primaries = append(tables[*row[0]].Primaries, *row[1])
	}
	return nil
}

// getForeigns returns the foreign keys of the given tables
func (m *SetUp) getForeigns(schema string, tables map[string]*SetUpMap, tx interface{}) error {
	tableNames := ""
	for _, table := range tables {
		tableNames += "'" + table.TableName + "',"
	}
	query := fmt.Sprintf(SetUpSelecrForeign, schema, tableNames[:len(tableNames)-1])
	_, rows, err := m.RepoSource.Query(tx, query)
	if err != nil {
		return err
	}
	for _, row := range rows {
		tables[*row[0]].Foreigns = append(tables[*row[0]].Foreigns, &SetUpForeign{
			ColumnName:       *row[1],
			ReferencedSchema: *row[2],
			ReferencedTable:  *row[3],
			ReferencedColumn: *row[4],
		})
	}
	return nil
}

// orderTables orders the tables by the foreign keys
func (m *SetUp) getOrder(tables map[string]*SetUpMap) map[string]int64 {
	order := make(map[string]int64, len(tables))
	for _, table := range tables {
		order[table.TableName] = 0
	}
	for _, table := range tables {
		for _, foreign := range table.Foreigns {
			order[foreign.ReferencedTable]++
		}
	}
	return order
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
