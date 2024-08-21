package usecase

import (
	"errors"
	"fmt"
	"strings"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	updateDisableFK = "SET FOREIGN_KEY_CHECKS = 0;"
	updateEnableFK  = "SET FOREIGN_KEY_CHECKS = 1;"
	updateGetFields = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '%s' AND TABLE_NAME = '%s';"
	updateSelectID1 = "SELECT %s, md5(concat(%s)) FROM %s.%s WHERE %s > %d and %s <= %d order by 1;"
	updateSelectID2 = "SELECT %s, md5(concat(%s)) FROM %s.%s WHERE %s in (%s) order by 1;"
	updateSelectAll = "SELECT * FROM %s.%s WHERE %s in (%s);"
	updateInsert    = "REPLACE INTO %s.%s(%s) VALUES %s;"
	returnMessage   = "%d processed, %d updated"
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
	ids, end, processed, updated, err := c.getIds(j, r, txTarget)
	if err != nil {
		return "", -1, err
	}
	if err := c.update(j, ids, txTarget); err != nil {
		return "", -1, err
	}
	if err := c.setJob(j, end, txTarget); err != nil {
		return "", -1, err
	}
	message := fmt.Sprintf(returnMessage, processed, updated)
	return message, 0, nil
}

// getIds gets the ids from source and target when any field is different
func (c *Update) getIds(j *domain.Job, refs []References, txTarget interface{}) ([][]*string, int64, int64, int64, error) {
	fields, err := c.getFields(j, txTarget)
	if err != nil {
		return nil, -1, -1, -1, err
	}
	retIds := make([][]*string, 0)
	var init, end, processed, updated int64
	var cont bool
	for {
		cont, init, end = c.getLimits(j, refs, init)
		if !cont {
			break
		}
		ids, proc, upd, err := c.getIdsPart(j, fields, init, end, txTarget)
		if err != nil {
			return nil, -1, -1, -1, err
		}
		retIds = append(retIds, ids...)
		processed += int64(proc)
		updated += int64(upd)
		init = end
	}
	return retIds, end, processed, updated, nil
}

// getLimits gets the limits from source
func (c *Update) getLimits(j *domain.Job, refs []References, init int64) (bool, int64, int64) {
	if init == 0 {
		init = refs[0].Last - j.Limit
		if init < 0 {
			init = 0
		}
	}
	step := refs[0].Limit
	if step > InLimit {
		step = InLimit
	}
	end := init + step
	if end > refs[0].Last {
		end = refs[0].Last
	}
	return init < end, init, end
}

// getIdsPart gets the ids from source and target when any field is different in parts
func (c *Update) getIdsPart(j *domain.Job, fields string, init, end int64, txTarget interface{}) ([][]*string, int64, int64, error) {
	idsTarget, err := c.getTargetIds(j, fields, init, end, txTarget)
	if err != nil {
		return nil, 0, 0, err
	}
	if len(idsTarget) == 0 {
		return idsTarget, 0, 0, nil
	}
	idsSource, err := c.getSourceIds(j, fields, idsTarget)
	if err != nil {
		return nil, 0, 0, err
	}
	if len(idsSource) != len(idsTarget) {
		return nil, -0, 0, errors.New(port.ErrInvalidUpdateSource)
	}
	ids, err := c.getDifferentIds(idsSource, idsTarget)
	if err != nil {
		return nil, 0, 0, err
	}
	return ids, int64(len(idsTarget)), int64(len(ids)), nil
}

// update get from source and update target
func (c *Update) update(j *domain.Job, ids [][]*string, txTarget interface{}) error {
	if len(ids) == 0 {
		return nil
	}
	cols, rows, err := c.getSource(j, ids)
	if err != nil {
		return err
	}
	if len(rows) != len(ids) {
		return errors.New(port.ErrInvalidUpdateSource)
	}
	if err := c.updateTarget(j, cols, rows, txTarget); err != nil {
		return err
	}
	return nil
}

// getFields gets the fields from target table
func (c *Update) getFields(j *domain.Job, tx interface{}) (string, error) {
	q := fmt.Sprintf(updateGetFields, j.Base, j.Object)
	_, rows, err := c.RepoTarget.Query(tx, q)
	if err != nil {
		return "", err
	}
	mountedFields, err := c.mountFields(rows)
	if err != nil {
		return "", err
	}
	return mountedFields, nil
}

// mountDFields mounts the fields to a string
func (c *Update) mountFields(fields [][]*string) (string, error) {
	if len(fields) == 0 {
		return "", errors.New(port.ErrInvalidUpdateFields)
	}
	ret := ""
	pat := "ifnull(%s, ''), "
	for _, field := range fields {
		ret += fmt.Sprintf(pat, *field[0])
	}
	return ret[:len(ret)-2], nil
}

// getSourceid gets the ids from target table
func (c *Update) getTargetIds(j *domain.Job, fields string, init, end int64, tx interface{}) ([][]*string, error) {
	q := fmt.Sprintf(updateSelectID1, j.Field, fields, j.Base, j.Object, j.Field, init, j.Field, end)
	_, rows, err := c.RepoTarget.Query(tx, q)
	if err != nil {
		return nil, err
	}
	return rows, nil
}

// getSourceid gets the ids from target table
func (c *Update) getSourceIds(j *domain.Job, fields string, idsTarget [][]*string) ([][]*string, error) {
	tx := c.RepoSource.Begin(j.Base)
	defer c.RepoSource.Rollback(tx)
	q := fmt.Sprintf(updateSelectID2, j.Field, fields, j.Base, j.Object, j.Field, c.mountIds(idsTarget))
	_, rows, err := c.RepoSource.Query(tx, q)
	if err != nil {
		return nil, err
	}
	return rows, nil
}

// matchIds matches the ids from source and target
func (c *Update) getDifferentIds(idsSource [][]*string, idsTarget [][]*string) ([][]*string, error) {
	ret := make([][]*string, 0)
	if len(idsSource) != len(idsTarget) {
		return nil, errors.New(port.ErrInvalidUpdateSource)
	}
	for i, id := range idsSource {
		if *id[1] != *idsTarget[i][1] {
			ret = append(ret, id)
		}
	}
	return ret, nil
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
	ret := ""
	for _, id := range ids {
		ret += *id[0] + ","
	}
	return ret[:len(ret)-1]
}

// updateTarget updates the target table
func (c *Update) updateTarget(j *domain.Job, cols []string, rows [][]*string, txTarget interface{}) error {
	q := fmt.Sprintf(updateInsert, j.Base, j.Object, c.mountCols(cols), c.mountRows(rows))
	_, err := c.RepoTarget.Exec(txTarget, updateDisableFK)
	if err != nil {
		return err
	}
	_, err = c.RepoTarget.Exec(txTarget, q)
	if err != nil {
		return err
	}
	_, err = c.RepoTarget.Exec(txTarget, updateEnableFK)
	if err != nil {
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
			ret += c.formatValue(r) + ","
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

// formatValue formats the value to insert
func (c *Update) formatValue(col *string) string {
	if col == nil {
		return "NULL"
	}
	ret := *col
	ret = strings.Replace(ret, "'", "''", -1)
	ret = strings.Replace(ret, "\\", "\\\\", -1)
	ret = strings.Replace(ret, "\n", "", -1)
	ret = strings.Replace(ret, "\r", "", -1)
	ret = strings.Replace(ret, "\t", "", -1)
	ret = strings.Replace(ret, "0000-00-00 00:00:00", "2001-01-01 00:00:00", -1)
	return fmt.Sprintf("'%s'", ret)
}