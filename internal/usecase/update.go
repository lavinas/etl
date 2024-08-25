package usecase

import (
	"errors"
	"fmt"
	"strings"
	"sync"
	"time"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

// Update is a struct that represents the use case update a object from database
type Update struct {
	Base
}

// Run runs the use case
func (c *Update) Run(job port.Domain, txTarget interface{}) (string, int64, error) {
	j := job.(*domain.Job)
	if j.Type != "table" {
		return "", -1, errors.New(port.ErrJobTypeNotImplemented)
	}
	ids, end, processed, updated, err := c.getIdsLoop(j, txTarget)
	if err != nil {
		return "", -1, err
	}
	if err := c.update(j, ids, txTarget); err != nil {
		return "", -1, err
	}
	if err := c.setJob(j, end, txTarget); err != nil {
		return "", -1, err
	}
	message := fmt.Sprintf(port.UpdateReturnMessage, processed, updated)
	return message, 0, nil
}

// getIds gets the ids from source and target when any field is different
func (c *Update) getIdsLoop(j *domain.Job, txTarget interface{}) ([][]*string, int64, int64, int64, error) {
	retIds := make([][]*string, 0)
	var updated int64
	idsTarget, fields, end, err := c.getTargetIds(j, txTarget)
	if err != nil {
		return nil, 0, 0, 0, err
	}
	lim := int64(len(idsTarget))
	for i := int64(0); i < lim; i += port.InLimit {
		ids := idsTarget[i:min(i+port.InLimit, lim)]
		parcIds, u, err := c.getFielteredIds(j, fields, ids)
		if err != nil {
			return nil, -1, -1, -1, err
		}
		retIds = append(retIds, parcIds...)
		updated += u
	}
	return retIds, end, lim, updated, nil
}

// getIdsWait gets the ids from source and target when any field is different
func (c *Update) getFielteredIds(j *domain.Job, fields string, ids [][]*string) ([][]*string, int64, error) {
	var updated int64
	var id [][]*string
	var err error
	wg := sync.WaitGroup{}
	chn := make(chan bool)
	wg.Add(2)
	go func(chn chan bool) {
		id, updated, err = c.getFielteredIdsAtom(j, fields, ids)
		wg.Done()
		chn <- true
	}(chn)
	go func() {
		time.Sleep(port.DbRelief)
		wg.Done()
	}()
	select {
	case <-chn:
		wg.Wait()
	case <-c.Ctx.Done():
		return nil, -1, errors.New(port.ErrTimeout)
	case <-c.Signal:
		return nil, -1, errors.New(port.ErrInterrupted)
	}
	return id, updated, err
}

// getIdsPart gets the ids from source and target when any field is different in parts
func (c *Update) getFielteredIdsAtom(j *domain.Job, fields string, idsTarget [][]*string) ([][]*string, int64, error) {
	if len(idsTarget) == 0 {
		return idsTarget, 0, nil
	}
	idsSource, err := c.getSourceIds(j, fields, idsTarget)
	if err != nil {
		return nil, 0, err
	}
	if len(idsSource) != len(idsTarget) {
		return nil, 0, errors.New(port.ErrInvalidUpdateSource)
	}
	ids, err := c.getDifferentIds(idsSource, idsTarget)
	if err != nil {
		return nil, 0, err
	}
	return ids, int64(len(ids)), nil
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
	q := fmt.Sprintf(port.UpdateGetFields, j.Base, j.Object)
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
func (c *Update) getTargetIds(j *domain.Job, tx interface{}) ([][]*string, string, int64, error) {
	fields, err := c.getFields(j, tx)
	if err != nil {
		return nil, "", 0, err
	}
	last := j.Refs[0].Job.Keys[0].Last
	step := j.Keys[0].Step
	field := j.Keys[0].Name
	init := last - step
	if init < 0 {
		init = 0
	}
	q := fmt.Sprintf(port.UpdateSelectID1, field, fields, j.Base, j.Object, field, init, field, last)
	_, rows, err := c.RepoTarget.Query(tx, q)
	if err != nil {
		return nil, "", 0, err
	}
	return rows, fields, last, nil
}

// getSourceid gets the ids from target table
func (c *Update) getSourceIds(j *domain.Job, fields string, idsTarget [][]*string) ([][]*string, error) {
	tx := c.RepoSource.Begin(j.Base)
	defer c.RepoSource.Rollback(tx)
	field := j.Keys[0].Name
	q := fmt.Sprintf(port.UpdateSelectID2, field, fields, j.Base, j.Object, field, c.mountIds(idsTarget))
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
	field := j.Keys[0].Name
	q := fmt.Sprintf(port.UpdateSelectAll, j.Base, j.Object, field, c.mountIds(ids))
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
	q := fmt.Sprintf(port.UpdateInsert, j.Base, j.Object, c.mountCols(cols), c.mountRows(rows))
	_, err := c.RepoTarget.Exec(txTarget, port.UpdateDisableFK)
	if err != nil {
		return err
	}
	_, err = c.RepoTarget.Exec(txTarget, q)
	if err != nil {
		return err
	}
	_, err = c.RepoTarget.Exec(txTarget, port.UpdateEnableFK)
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
func (c *Update) setJob(j *domain.Job, last int64, txTarget interface{}) error {
	j.Keys[0].Last = last
	if err := j.Keys[0].Save(c.RepoTarget, txTarget); err != nil {
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
