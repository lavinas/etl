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
	copyLimit     = 5000
	copyDisableFK = "SET FOREIGN_KEY_CHECKS = 0;"
	copyEnableFK  = "SET FOREIGN_KEY_CHECKS = 1;"
	copySelect    = "SELECT * FROM %s WHERE %s > %d and %s <= %d order by %s;"
	copyInsert    = "INSERT INTO %s.%s %s VALUES %s;"
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
func (c *Copy) Run(job port.Domain, refs interface{}, txTarget interface{}) (string, error) {
	j := job.(*domain.Job)
	if j.Type != "table" {
		return "", errors.New(port.ErrJobTypeNotImplemented)
	}
	cols, rows, err := c.getSource(j)
	if err != nil {
		return "", err
	}
	if len(rows) == 0 {
		return "0 processed", nil
	}
	getLen := len(rows)
	if rows, err = c.filterRefs(refs, cols, rows, txTarget); err != nil {
		return "", err
	}
	_, err = c.putSource(txTarget, c.mountInsert(j.Base, j.Object, cols, rows))
	if err != nil {
		return "", err
	}
	if err := c.setJob(j, cols, rows, txTarget); err != nil {
		return "", err
	}
	return fmt.Sprintf("%d rows processed, %d copied", getLen, len(rows)), nil
}

// filterRefs filters the references
func (c *Copy) filterRefs(refereces interface{}, cols []string, rows [][]*string, tx interface{}) ([][]*string, error) {
	refs := refereces.([]References)
	if len(refs) == 0 {
		return rows, nil
	}
	colsMap := make(map[string]int)
	for i, col := range cols {
		colsMap[col] = i
	}
	for _, ref := range refs {
		min, max, err := c.getRefRange(ref.FieldReferred, colsMap, rows)
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
		rows, err = c.filterRef(ref.FieldReferred, possibles, colsMap, rows)
		if err != nil {
			return nil, err
		}
	}
	return rows, nil
}

// getRefPossibles gets the possible references
func (c *Copy) getRefPossibles(ref *References, min int64, max int64, txTarget interface{}) (map[int64]bool, error) {
	sql := fmt.Sprintf(copySelect, ref.Object, ref.FieldReferred, min-1, ref.FieldReferred, max, ref.FieldReferred)
	cols, rows, err := c.RepoTarget.Query(txTarget, sql)
	if err != nil {
		return nil, err
	}
	icol, err := c.getColumn(cols, ref.FieldReferred)
	if err != nil {
		return nil, err
	}
	possibles := make(map[int64]bool)
	for _, row := range rows {
		val, err := strconv.ParseInt(*row[icol], 10, 64)
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
		return nil, errors.New(port.ErrFieldNotFound)
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
		return 0, 0, errors.New(port.ErrFieldNotFound)
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
func (c *Copy) getSource(j *domain.Job) ([]string, [][]*string, error) {
	txSource := c.RepoSource.Begin(j.Base)
	defer c.RepoSource.Rollback(txSource)
	sql := fmt.Sprintf(copySelect, j.Object, j.Field, j.Last, j.Field, j.Last+copyLimit, j.Field)
	cols, rows, err := c.RepoSource.Query(txSource, sql)
	if err != nil {
		return nil, nil, err
	}
	return cols, rows, nil
}

// putSource puts the source data into the target
func (c *Copy) putSource(txTarget interface{}, cmd string) (int64, error) {
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
func (c *Copy) setJob(job *domain.Job, cols []string, rows [][]*string,txTarget interface{}) error {
	last, err := c.getLast(cols, rows, job.Field)
	if err != nil {
		return err
	}
	job.Last = last
	if err := job.Save(c.RepoTarget, txTarget); err != nil {
		return err
	}
	return nil
}

// getLast gets the last id from the source
func (c *Copy) getLast(cols []string, rows [][]*string, field string) (int64, error) {
	iField, err := c.getColumn(cols, field)
	if err != nil {
		return 0, err
	}
	last := rows[len(rows)-1][iField]
	ilast, err := strconv.ParseInt(*last, 10, 64)
	if err != nil {
		return 0, err
	}
	return ilast, nil
}

// mountInsert mounts the insert sql
func (c *Copy) mountInsert(base string, tablename string, cols []string, rows [][]*string) string {
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
	return fmt.Sprintf("'%s'", ret)
}

// getColumns gets the columns of the table
func (c *Copy) getColumn(cols []string, field string) (int, error) {
	for i, col := range cols {
		if col == field {
			return i, nil
		}
	}
	return -1, errors.New(port.ErrFieldNotFound)
}
