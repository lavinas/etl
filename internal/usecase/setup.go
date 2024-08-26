package usecase

import (
	"os"
	"fmt"

	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	SetUpSelectAll = "SELECT table_schema, table_name from information_schema.tables where table_schema = '%s';"
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

// Run runs the mount operation
func (m *SetUp) Run(in *port.SetUpIn, out chan *port.SetUpOut) {
	if in == nil || out == nil {
		panic("Setup: Invalid input parameters")
	}
	tables, err := m.getTables(in.Schema)
	if err != nil {
		out <- &port.SetUpOut{Status: "error", Detail: err.Error()}
		return
	}
	for table, schema := range tables {
		fmt.Println(table, schema)
	}
}

// getTables returns the tables of the given schema
func (m *SetUp) getTables(schema string) (map[string]string, error) {
	query := fmt.Sprintf(SetUpSelectAll, schema)
	tx := m.RepoSource.Begin("")
	defer m.RepoSource.Rollback(tx)
	_, rows, err := m.RepoSource.Query(tx, query)
	if err != nil {
		return nil, err
	}
	tables := make(map[string]string)
	for _, row := range rows {
		tables[*row[1]] = *row[0]
	}
	return tables, nil
}


