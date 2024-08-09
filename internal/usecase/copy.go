package usecase

import (
	"errors"
	"fmt"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	limit = 100
	sqlrow = "SELECT * FROM %s WHERE %s > %d limit %d;"
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
	rows, err := repoSource.Query(txSource, sql)
	if err != nil {
		return 0, err
	}
	defer rows.Close()
	txTarget := repoTarget.Begin(j.Base)
	defer repoTarget.Rollback(txTarget)
	for rows.Next() {
		columns, err := rows.Columns()
		if err != nil {
			return 0, err
		}
		values := make([]interface{}, len(columns))
		valuePtrs := make([]interface{}, len(columns))
		for i := range columns {
			valuePtrs[i] = &values[i]
		}
		if err := rows.Scan(valuePtrs...); err != nil {
			return 0, err
		}
		sql := fmt.Sprintf(sqlinsert, j.Object, j.Field, j.Last, limit)
		if _, err := repoTarget.Exec(txTarget, sql); err != nil {
			return 0, err
		}
	}
	if err := rows.Err(); err != nil {
		return 0, err
	}
	if err := repoTarget.Commit(txTarget); err != nil {
		return 0, err
	}
	if err := repoSource.Commit(txSource); err != nil {
		return 0, err
	}
	return rows.RowsAffected(), nil
}
