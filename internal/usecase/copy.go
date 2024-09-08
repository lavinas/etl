package usecase

import (
	"errors"
	"fmt"
	"strconv"
	"strings"
	"sync"
	"time"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

// Copy is a struct that represents the use case copy a object from database to another
type Copy struct {
	Base
}

// Run runs the use case
func (c *Copy) Run(job port.Domain, txTarget interface{}) (string, int64, error) {
	now := time.Now()
	j := job.(*domain.Job)
	if j.Type != "table" {
		return "", -1, errors.New(port.ErrJobTypeNotImplemented)
	}
	tmiss := float64(0)
	processed, missing, copied, err := c.runFactory(j, txTarget)
	if err != nil {
		return "", -1, err
	}
	if processed != 0 {
		tmiss = (time.Since(now).Seconds() * float64(missing)) / float64(3600*processed)
	}
	return fmt.Sprintf(port.CopyReturnMessage, processed, copied, tmiss), missing, nil
}

// runFactory runs the factory use case
func (c *Copy) runFactory(j *domain.Job, txTarget interface{}) (int64, int64, int64, error) {
	switch j.Action {
	case "all":
		return c.runCopyAll(j, txTarget)
	case "copy":
		return c.runCopy(j, txTarget)
	default:
		return -1, -1, -1, fmt.Errorf(port.ErrActionNotFound, j.Action)
	}
}

// runCopyAll runs the copy all use case
func (c *Copy) runCopyAll(j *domain.Job, txTarget interface{}) (int64, int64, int64, error) {
	cols, rows, err := c.getSourceAll(j)
	if err != nil {
		return -1, -1, -1, err
	}
	err = c.putSource(j, cols, rows, txTarget)
	if err != nil {
		return -1, -1, -1, err
	}
	return int64(len(rows)), 0, int64(len(rows)), nil
}

// runCopy runs the copy use case
func (c *Copy) runCopy(j *domain.Job, txTarget interface{}) (int64, int64, int64, error) {
	newLast, missing, processed, err := c.getLimits(j)
	if err != nil {
		return processed, missing, 0, err
	}
	cols, rows, err := c.getSource(j, newLast)
	if err != nil {
		return processed, missing, 0, err
	}
	if rows, err = c.filterRefs(j, cols, rows, txTarget); err != nil {
		return processed, missing, 0, err
	}
	cols, rows, err = c.getAllSource(j, rows)
	if err != nil {
		return processed, missing, 0, err
	}
	err = c.putSource(j, cols, rows, txTarget)
	if err != nil {
		return processed, missing, 0, err
	}
	if err := j.SetKeysLast(newLast, c.RepoTarget, txTarget); err != nil {
		return processed, missing, 0, err
	}
	return processed, missing, int64(len(rows)), nil
}

// filterRefs filters the references
func (c *Copy) filterRefs(j *domain.Job, cols []string, rows [][]*string, tx interface{}) ([][]*string, error) {
	if len(rows) == 0 || len(j.Refs) == 0 {
		return rows, nil
	}
	colsMap := make(map[string]int)
	for i, col := range cols {
		colsMap[col] = i
	}
	var err error
	for r := range j.Refs {
		for i := range j.Refs[r].Keys {
			rows, err = c.filterRefbyKey(j, r, i, colsMap, rows, tx)
			if err != nil {
				return nil, err
			}
		}
	}
	return rows, nil
}

// filterRefbyKey filters the references by key
func (c *Copy) filterRefbyKey(j *domain.Job, r int, i int, cols map[string]int, rows [][]*string, tx interface{}) ([][]*string, error) {
	min, max, err := c.getRefRange(j.Refs[r].Keys[i].Referrer, cols, rows)
	if err != nil {
		return nil, err
	}
	if err := c.filterRefLimits(&j.Refs[r].Job, j.Refs[r].Keys[i].Referred, max, tx); err != nil {
		return nil, err
	}
	possibles, err := c.getRefPossibles(&j.Refs[r], i, min, max, tx)
	if err != nil {
		return nil, err
	}
	rows, err = c.filterRef(j.Refs[r].Keys[i].Referrer, possibles, cols, rows)
	if err != nil {
		return nil, err
	}
	return rows, nil
}

// filterRefLimits filters the references by limits
func (c *Copy) filterRefLimits(job *domain.Job, name string, max int64, tx interface{}) error {
	keys := job.Keys
	for _, key := range keys {
		if key.Name == name {
			if max > key.Last {
				return fmt.Errorf(port.ErrReferenceNotDone, job.Name, max, key.Last)
			}
			return nil
		}
	}
	return c.filterRefLimitsbyDB(job, name, max, tx)
}

// filterRefLimitsbyDB filters the references by limits consulting the database
func (c *Copy) filterRefLimitsbyDB(job *domain.Job, name string, max int64, tx interface{}) error {
	q := fmt.Sprintf(port.CopyMaxClient, name, job.Base + "." + job.Object)
	_, rows, err := c.RepoTarget.Query(tx, q)
	if err != nil {
		return err
	}
	if rows[0][0] == nil {
		return fmt.Errorf(port.ErrReferenceNotDone, job.Name, max, 0)
	}
	val, err := strconv.ParseInt(*rows[0][0], 10, 64)
	if err != nil {
		return err
	}
	if max > val {
		return fmt.Errorf(port.ErrReferenceNotDone, job.Name, max, val)
	}
	return nil
}

// getRefPossibles gets the possible references
func (c *Copy) getRefPossibles(ref *domain.Ref, i int, min int64, max int64, txTarget interface{}) (map[int64]bool, error) {
	field := ref.Keys[i].Referred
	sql := fmt.Sprintf(port.CopySelectF, field, ref.Job.Base, ref.Job.Object, field, min-1, field, max)
	_, rows, err := c.RepoTarget.Query(txTarget, sql)
	if err != nil {
		return nil, err
	}
	possibles := make(map[int64]bool)
	for _, row := range rows {
		val, err := strconv.ParseInt(*row[0], 10, 64)
		if err != nil {
			return nil, err
		}
		possibles[val] = true
	}
	return possibles, nil
}

// filterRef filters the references
func (c *Copy) filterRef(field string, possibles map[int64]bool, cols map[string]int, rows [][]*string) ([][]*string, error) {
	iField, ok := cols[field]
	if !ok {
		return nil, errors.New(port.ErrFieldReferrerNotFound)
	}
	var filtered [][]*string
	for _, row := range rows {
		if row[iField] == nil {
			continue
		}
		val, err := strconv.ParseInt(*row[iField], 10, 64)
		if err != nil {
			return nil, err
		}
		if _, ok := possibles[val]; ok {
			filtered = append(filtered, row)
		}
	}
	return filtered, nil
}

// getRefRange gets the reference range of ids based on the source data
func (c *Copy) getRefRange(field string, cols map[string]int, rows [][]*string) (int64, int64, error) {
	iField, ok := cols[field]
	if !ok {
		return 0, 0, errors.New(port.ErrFieldReferrerNotFound)
	}
	var min, max int64
	for _, row := range rows {
		if row[iField] == nil {
			continue
		}
		val, err := strconv.ParseInt(*row[iField], 10, 64)
		if err != nil {
			return 0, 0, err
		}
		if min == 0 || val < min {
			min = val
		}
		if val > max {
			max = val
		}
	}
	return min, max, nil
}

// getSource gets the source data for the insert
func (c *Copy) getSource(j *domain.Job, limit []int64) ([]string, [][]*string, error) {
	fields, err := c.mountSourceFields(j)
	if err != nil {
		return nil, nil, err
	}
	txSource := c.RepoSource.Begin(j.Base)
	defer c.RepoSource.Rollback(txSource)
	cols := []string{}
	rows := [][]*string{}
	for i := range j.Keys {
		co, ro, err := c.getSourceByKey(j, i, fields, limit[i], txSource)
		if err != nil {
			return nil, nil, err
		}
		if len(ro) != 0 {
			cols = co
			rows = append(rows, ro...)
		}
	}
	return cols, rows, nil
}

// mountSourceFields mounts the source fields name for the select
func (c *Copy) mountSourceFields(j *domain.Job) (string, error) {
	ret := ""
	for _, key := range j.Keys {
		ret += key.Name + ", "
	}
	for _, ref := range j.Refs {
		for _, key := range ref.Keys {
			ret += key.Referrer + ", "
		}
	}
	if ret == "" {
		return "", errors.New(port.ErrFieldNotFound)
	}
	return ret[:len(ret)-2], nil
}

// getSourceByKey gets the source data for the insert
func (c *Copy) getSourceByKey(j *domain.Job, i int, fields string, limit int64, txSource interface{}) ([]string, [][]*string, error) {
	sql := fmt.Sprintf(port.CopySelectF, fields, j.Base, j.Object, j.Keys[i].Name, j.Keys[i].Last, j.Keys[i].Name, limit)
	cols, rows, err := c.RepoSource.Query(txSource, sql)
	if err != nil {
		return nil, nil, err
	}
	return cols, rows, nil
}

// getSourceAll gets all the source data for the insert
func (c *Copy) getSourceAll(j *domain.Job) ([]string, [][]*string, error) {
	tx := c.RepoSource.Begin(j.Base)
	defer c.RepoSource.Rollback(tx)
	sql := fmt.Sprintf(port.CopySelectAllCount, j.Base, j.Object)
	_, rows, err := c.RepoSource.Query(tx, sql)
	if err != nil {
		return nil, nil, err
	}
	count, _ := strconv.ParseInt(*rows[0][0], 10, 64)
	if count > port.InLimit {
		return nil, nil, errors.New(port.ErrTooManyRows)
	}
	sql = fmt.Sprintf(port.CopySelectAll, j.Base, j.Object)
	cols, rows, err := c.RepoSource.Query(tx, sql)
	if err != nil {
		return nil, nil, err
	}
	return cols, rows, nil
}

// getAllSource gets all the source data for the insert
func (c *Copy) getAllSource(j *domain.Job, rows [][]*string) ([]string, [][]*string, error) {
	if len(rows) == 0 {
		return nil, nil, nil
	}
	var cols []string
	var rrows [][]*string
	txSource := c.RepoSource.Begin(j.Base)
	defer c.RepoSource.Rollback(txSource)
	last := int64(len(rows))
	for i := int64(0); i < last; i += port.InLimit {
		col, row, err := c.getAllSouceAtomic(j, rows[i:min(i+port.InLimit, last)], txSource)
		if err != nil {
			return nil, nil, err
		}
		rrows = append(rrows, row...)
		cols = col
	}
	return cols, rrows, nil
}

// runWait waits for the run to finish or db relief time
func (c *Copy) getAllSouceAtomic(j *domain.Job, rows [][]*string, txSource interface{}) ([]string, [][]*string, error) {
	var cols []string
	var row [][]*string
	var err error
	wg := sync.WaitGroup{}
	wg.Add(2)
	chn := make(chan bool, 1)
	go func(chn chan bool) {
		cols, row, err = c.getAllSourceAtom(j, rows, txSource)
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
		return nil, nil, errors.New(port.ErrTimeout)
	case <-c.Signal:
		return nil, nil, errors.New(port.ErrInterrupted)
	}
	return cols, row, err
}

// getAllSource steps the source data for the insert
func (c *Copy) getAllSourceAtom(j *domain.Job, rows [][]*string, txSource interface{}) ([]string, [][]*string, error) {
	fields, err := c.mountAllSourceFields(j)
	if err != nil {
		return nil, nil, err
	}
	ids, err := c.mountAllSourceIds(j, rows)
	if err != nil {
		return nil, nil, err
	}
	sql := fmt.Sprintf(port.CopySelectIn, j.Base, j.Object, fields, ids, fields)
	cols, rows, err := c.RepoSource.Query(txSource, sql)
	if err != nil {
		return nil, nil, err
	}
	return cols, rows, nil
}

// mountAllSourceFields mounts the source fields name for the select
func (c *Copy) mountAllSourceFields(j *domain.Job) (string, error) {
	ret := ""
	for _, key := range j.Keys {
		ret += key.Name + ", "
	}
	if ret == "" {
		return "", errors.New(port.ErrFieldNotFound)
	}
	return ret[:len(ret)-2], nil
}

// mountAllSourceIds mounts the source ids for the select
func (c *Copy) mountAllSourceIds(j *domain.Job, rows [][]*string) (string, error) {
	ret := ""
	for _, row := range rows {
		r := ""
		for i := 0; i < len(j.Keys); i++ {
			r += *row[i] + ", "
		}
		ret += "(" + r[:len(r)-2] + "), "
	}
	if ret == "" {
		return "", errors.New(port.ErrFieldNotFound)
	}
	return ret[:len(ret)-2], nil
}

// putSource puts the source data into the target
func (c *Copy) putSource(j *domain.Job, cols []string, rows [][]*string, txTarget interface{}) error {
	if len(rows) == 0 {
		return nil
	}
	if _, err := c.RepoTarget.Exec(txTarget, port.CopyDisableFK); err != nil {
		return err
	}
	scols := c.mountInsertCols(cols)
	last := int64(len(rows))
	for i := int64(0); i < last; i += port.OutLimit {
		if err := c.putSourceAtomic(j, scols, rows[i:min(i+port.OutLimit, last)], txTarget); err != nil {
			return err
		}
	}
	if _, err := c.RepoTarget.Exec(txTarget, port.CopyEnableFK); err != nil {
		return err
	}
	return nil
}

// putSourceAtomic puts the source data in installments way
func (c *Copy) putSourceAtomic(j *domain.Job, cols string, rows [][]*string, txTarget interface{}) error {
	cmd := c.mountInsert(j.Base, j.Object, cols, rows)
	if cmd == "" {
		return nil
	}
	if _, err := c.RepoTarget.Exec(txTarget, cmd); err != nil {
		return err
	}
	return nil
}

// mountInsertCols mounts coluns for insert
func (c *Copy) mountInsertCols(cols []string) string {
	strCols := "("
	for _, col := range cols {
		strCols += fmt.Sprintf("`%s`, ", col)
	}
	return strCols[:len(strCols)-2] + ")"
}

// mountInsert mounts the insert sql
func (c *Copy) mountInsert(base string, tablename string, cols string, rows [][]*string) string {
	values := ""
	for _, row := range rows {
		value := ""
		for _, col := range row {
			value += c.formatValue(col) + ", "
		}
		values += fmt.Sprintf("(%s), ", value[:len(value)-2])
	}
	return fmt.Sprintf(port.CopyInsert, base, tablename, cols, values[:len(values)-2])
}

// formatValue formats the value to insert
func (c *Copy) formatValue(col *string) string {
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

// getMaxClient gets the max id from the client table
func (c *Copy) getLimits(j *domain.Job) ([]int64, int64, int64, error) {
	tx := c.RepoSource.Begin(j.Base)
	defer c.RepoSource.Rollback(tx)
	limits := make([]int64, len(j.Keys))
	var missing, processed int64
	for i := range j.Keys {
		l, m, p, err := c.getKeyLimit(j, i, tx)
		if err != nil {
			return nil, -1, -1, err
		}
		limits[i] = l
		missing += m
		processed += p
	}
	return limits, missing, processed, nil
}

// getKeyLimit gets the limit of the job key
func (c *Copy) getKeyLimit(j *domain.Job, i int, tx interface{}) (int64, int64, int64, error) {
	q := fmt.Sprintf(port.CopyMaxClient, j.Keys[i].Name, j.Object)
	_, rows, err := c.RepoSource.Query(tx, q)
	if err != nil {
		return -1, -1, -1, err
	}
	if len(rows[0]) == 0 || rows[0][0] == nil {
		return 0, 0, 0, nil
	}
	max, err := strconv.ParseInt(*rows[0][0], 10, 64)
	if err != nil {
		return -1, -1, -1, err
	}
	l := j.Keys[i].Last + j.Keys[i].Step
	if l > max {
		l = max
	}
	return l, max - l, l - j.Keys[i].Last, nil
}
