package usecase

import (
	"errors"
	"fmt"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	limit     = 10
	sqlrow    = "SELECT * FROM %s WHERE %s > %d limit %d;"
	sqlinsert = "INSERT INTO %s (%s) VALUES (%s);"
)

// Copy is a struct that represents the use case copy a object from database to another
type Copy struct {
}

// NewCopy creates a new use case
func NewCopy() *Copy {
	return &Copy{}
}

// Run runs the use case
func (c *Copy) Run(job port.Domain, repoSource port.Repository, repoTarget port.Repository) (int64, error) {
	j := job.(*domain.Job)
	if j.Type != "table" {
		return 0, errors.New(port.ErrJobTypeNotImplemented)
	}
	txSource := repoSource.Begin(j.Base)
	defer repoSource.Rollback(txSource)
	sql := fmt.Sprintf(sqlrow, j.Object, j.Field, j.Last, limit)
	cols, rows, err := repoSource.Query(txSource, sql)
	if err != nil {
		return 0, err
	}
	for _, row := range rows {
		fmt.Println(cols[0], *row[0])
	}
	fmt.Println("Rows: ", len(rows), int64(len(rows)))
	return int64(len(rows)), nil
}
