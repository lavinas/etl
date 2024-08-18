package usecase

import (
	"errors"
	"fmt"
	"strconv"
	"strings"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	copyDisableFK = "SET FOREIGN_KEY_CHECKS = 0;"
	copyEnableFK  = "SET FOREIGN_KEY_CHECKS = 1;"
	copyMaxClient = "SELECT max(%s) FROM %s;"
	copySelectAll = "SELECT * FROM %s.%s WHERE %s in (%s) order by %s;"
	copySelectF   = "SELECT %s FROM %s.%s WHERE %s > %d and %s <= %d;"
	copyInsert    = "INSERT IGNORE INTO %s.%s %s VALUES %s;"
)

// Copy is a struct that represents the use case copy a object from database to another
type Copy struct {
	Base
}

// NewCopy creates a new use case
func NewCopy(repoSource port.Repository, repoTarget port.Repository) *Copy {
	return &Copy{
		Base: Base{
			RepoSource: repoSource,
			RepoTarget: repoTarget,
		},
	}
}

// Run runs the use case
func (c *Copy) Run(job port.Domain, refs interface{}, txTarget interface{}) (string, int64, error) {
	j := job.(*domain.Job)
	if j.Type != "table" {
		return "", -1, errors.New(port.ErrJobTypeNotImplemented)
	}
	limit, missing, processed, err := c.getLimits(j.Object, j.Field, j.Last, j.Limit)
	if err != nil {
		return "", -1, err
	}
	cols, rows, err := c.getSource(j, refs, limit)
	if err != nil {
		return "", -1, err
	}
	if rows, err = c.filterRefs(refs, cols, rows, txTarget); err != nil {
		return "", -1, err
	}
	cols, rows, err = c.getAllSource(j, rows)
	if err != nil {
		return "", -1, err
	}
	_, err = c.putSource(txTarget, c.mountInsert(j.Base, j.Object, cols, rows))
	if err != nil {
		return "", -1, err
	}
	if err := c.setJob(j, limit, txTarget); err != nil {
		return "", -1, err
	}
	return fmt.Sprintf("%d rows processed, %d copied, %d missing", processed, len(rows), missing), missing, nil
}

// filterRefs filters the references
func (c *Copy) filterRefs(refereces interface{}, cols []string, rows [][]*string, tx interface{}) ([][]*string, error) {
	if len(rows) == 0 {
		return rows, nil
	}
	refs := refereces.([]References)
	if len(refs) == 0 {
		return rows, nil
	}
	colsMap := make(map[string]int)
	for i, col := range cols {
		colsMap[col] = i
	}
	for _, ref := range refs {
		min, max, err := c.getRefRange(ref.FieldReferrer, colsMap, rows)
		if err != nil {
			return nil, err
		}
		if max > ref.Last {
			return nil, fmt.Errorf(port.ErrReferenceNotDone, ref.Name)
		}
		possibles, err := c.getRefPossibles(&ref, min, max, tx)
		if err != nil {
			return nil, err
		}
		rows, err = c.filterRef(ref.FieldReferrer, possibles, colsMap, rows)
		if err != nil {
			return nil, err
		}
	}
	return rows, nil
}

// getRefPossibles gets the possible references
func (c *Copy) getRefPossibles(ref *References, min int64, max int64, txTarget interface{}) (map[int64]bool, error) {
	sql := fmt.Sprintf(copySelectF, ref.FieldReferred, ref.Base, ref.Object, ref.FieldReferred, min-1, ref.FieldReferred, max)
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
func (c *Copy) getSource(j *domain.Job, references interface{}, limit int64) ([]string, [][]*string, error) {
	fields := j.Field + ", "
	refs := references.([]References)
	for _, ref := range refs {
		if ref.FieldReferrer != j.Field {
			fields += ref.FieldReferrer + ", "
		}
	}
	fields = fields[:len(fields)-2]
	txSource := c.RepoSource.Begin(j.Base)
	defer c.RepoSource.Rollback(txSource)
	sql := fmt.Sprintf(copySelectF, fields, j.Base, j.Object, j.Field, j.Last, j.Field, limit)
	cols, rows, err := c.RepoSource.Query(txSource, sql)
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
	ids := ""
	for _, row := range rows {
		ids += *row[0] + ", "
	}
	ids = ids[:len(ids)-2]
	txSource := c.RepoSource.Begin(j.Base)
	defer c.RepoSource.Rollback(txSource)
	sql := fmt.Sprintf(copySelectAll, j.Base, j.Object, j.Field, ids, j.Field)
	cols, rows, err := c.RepoSource.Query(txSource, sql)
	if err != nil {
		return nil, nil, err
	}
	return cols, rows, nil
}

// putSource puts the source data into the target
func (c *Copy) putSource(txTarget interface{}, cmd string) (int64, error) {
	if cmd == "" {
		return 0, nil
	}
	_, err := c.RepoTarget.Exec(txTarget, copyDisableFK)
	if err != nil {
		return 0, err
	}
	_, err = c.RepoTarget.Exec(txTarget, cmd)
	if err != nil {
		return 0, err
	}
	done, err := c.RepoTarget.Exec(txTarget, copyEnableFK)
	if err != nil {
		return 0, err
	}
	return done, nil
}

// setJob sets the job last id
func (c *Copy) setJob(job *domain.Job, last int64, txTarget interface{}) error {
	job.Last = last
	if err := job.Save(c.RepoTarget, txTarget); err != nil {
		return err
	}
	return nil
}

// mountInsert mounts the insert sql
func (c *Copy) mountInsert(base string, tablename string, cols []string, rows [][]*string) string {
	if len(rows) == 0 {
		return ""
	}
	strCols := "("
	for _, col := range cols {
		strCols += fmt.Sprintf("%s, ", col)
	}
	strCols = strCols[:len(strCols)-2] + ")"
	values := ""
	for _, row := range rows {
		value := ""
		for _, col := range row {
			value += c.formatValue(col) + ", "
		}
		values += fmt.Sprintf("(%s), ", value[:len(value)-2])
	}
	return fmt.Sprintf(copyInsert, base, tablename, strCols, values[:len(values)-2])
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
func (c *Copy) getLimits(object string, field string, last int64, limit int64) (int64, int64, int64, error) {
	tx := c.RepoSource.Begin(loadClientSourceBase)
	defer c.RepoSource.Rollback(tx)
	q := fmt.Sprintf(copyMaxClient, field, object)
	_, rows, err := c.RepoSource.Query(tx, q)
	if err != nil {
		return -1, -1, -1, err
	}
	if len(rows) == 0 || rows[0] == nil {
		return -1, -1, -1, errors.New(port.ErrFieldNotFound)
	}
	max, err := strconv.ParseInt(*rows[0][0], 10, 64)
	if err != nil {
		return -1, -1, -1, err
	}
	l := last + limit
	if l > max {
		l = max
	}
	missing := max - l
	processed := l - last
	return l, missing, processed, nil
}
