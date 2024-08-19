package usecase

import (
	"errors"
	"fmt"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	updateDisableFK = "SET FOREIGN_KEY_CHECKS = 0;"
	updateEnableFK  = "SET FOREIGN_KEY_CHECKS = 1;"
	updateSelectId  = "SELECT %s FROM %s.%s WHERE %s > %d and %s <= %d;"
	updateSelectAll = "SELECT * FROM %s.%s WHERE %s in (%s);"
	updateInsert    = "REPLACE INTO %s.%s(%s) VALUES %s;"
)

// Update is a struct that represents the use case update a object from database
type Update struct {
	Base
}

// NewUpdate creates a new use case
func NewUpdate(repoSource port.Repository, repoTarget port.Repository) *Update {
	return &Update{
		Base: Base{
			RepoSource: repoSource,
			RepoTarget: repoTarget,
		},
	}
}

// Run runs the use case
func (c *Update) Run(job port.Domain, refs interface{}, txTarget interface{}) (string, int64, error) {
	j := job.(*domain.Job)
	r := refs.([]References)
	if j.Type != "table" {
		return "", -1, errors.New(port.ErrJobTypeNotImplemented)
	}
	ids, end, missing, err := c.getIds(j, r)
	if err != nil {
		return "", -1, err
	}
	if len(ids) == 0 {
		return "0 processed, 0 updated, 0 missing", 0, nil
	}
	cols, rows, err := c.getSource(j, ids)
	if err != nil {
		return "", -1, err
	}
	if len(rows) != len(ids) {
		return "", -1, errors.New(port.ErrInvalidUpdateSource)
	}
	if err := c.updateTarget(j, cols, rows, txTarget); err != nil {
		return "", -1, err
	}
	if err := c.setJob(j, end, txTarget); err != nil {
		return "", -1, err
	}
	fmt.Println("count: ", len(rows), len(cols))
	return "", missing, nil
}

// getSourceid gets the ids from target table
func (c *Update) getIds(j *domain.Job, refs []References) ([][]*string, int64, int64, error) {
	init, end, missing, err := c.getLimits(j, refs)
	if err != nil {
		return nil, -1, -1, err
	}
	q := fmt.Sprintf(updateSelectId, j.Field, j.Base, j.Object, j.Field, init, j.Field, end)
	tx := c.RepoTarget.Begin(refs[0].Base)
	defer c.RepoTarget.Rollback(tx)
	_, rows, err := c.RepoTarget.Query(tx, q)
	if err != nil {
		return nil, -1, -1, err
	}
	return rows, end, missing, nil
}

// getLimits gets the limits to update
func (c *Update) getLimits(j *domain.Job, refs []References) (int64, int64, int64, error) {
	if len(refs) != 1 {
		return -1, -1, -1, errors.New(port.ErrInvalidUpadateReferences)
	}
	init := refs[0].Last - j.Limit
	if init < j.Last {
		init = j.Last
	}
	end := init + refs[0].Limit
	missing := refs[0].Last - end
	return init, end, missing, nil
}

// getSource gets the source data
func (c *Update) getSource(j *domain.Job, ids [][]*string) ([]string, [][]*string, error) {
	q := fmt.Sprintf(updateSelectAll, j.Base, j.Object, j.Field, c.mountIds(ids))
	tx := c.RepoSource.Begin(j.Base)
	defer c.RepoSource.Rollback(tx)
	cols, rows, err := c.RepoSource.Query(tx, q)
	if err != nil {
		return nil, nil, err
	}
	return cols, rows, nil
}

// mountIds mounts the ids to a string
func (c *Update) mountIds(ids [][]*string) string {
	fmt.Println("ids: ", len(ids))
	ret := ""
	for _, id := range ids {
		ret += *id[0] + ","
	}
	return ret[:len(ret)-1]
}

// updateTarget updates the target table
func (c *Update) updateTarget(j *domain.Job, cols []string, rows [][]*string, txTarget interface{}) error {
	q := fmt.Sprintf(updateInsert, j.Base, j.Object, c.mountCols(cols), c.mountRows(rows))
	_, err := c.RepoTarget.Exec(txTarget, q)
	if err != nil {
		return err
	}
	if err := c.RepoTarget.Commit(txTarget); err != nil {
		return err
	}
	return nil
}

// mountCols mounts the columns to a string
func (c *Update) mountCols(cols []string) string {
	ret := ""
	for _, col := range cols {
		ret += col + ","
	}
	return ret[:len(ret)-1]
}

// mountRows mounts the rows to a string
func (c *Update) mountRows(rows [][]*string) string {
	ret := ""
	for _, row := range rows {
		ret += "("
		for _, r := range row {
			ret += *r + ","
		}
		ret = ret[:len(ret)-1] + "),"
	}
	return ret[:len(ret)-1]
}

// setJob sets the job last id
func (c *Update) setJob(job *domain.Job, last int64, txTarget interface{}) error {
	job.Last = last
	if err := job.Save(c.RepoTarget, txTarget); err != nil {
		return err
	}
	return nil
}