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
	limit     = 100
	disableFK = "SET FOREIGN_KEY_CHECKS = 0;"
	enableFK  = "SET FOREIGN_KEY_CHECKS = 1;"
	sqlrow    = "SELECT * FROM %s WHERE %s > %d and %s <= %d order by %s;"
	sqlinsert = "INSERT INTO %s.%s %s VALUES %s;"
)

// Copy is a struct that represents the use case copy a object from database to another
type Copy struct {
}

// NewCopy creates a new use case
func NewCopy() *Copy {
	return &Copy{}
}

// Run runs the use case
func (c *Copy) Run(job port.Domain, refs map[string]port.Domain, repoSource port.Repository, repoTarget port.Repository, txTarget interface{}) (string, error) {
	j := job.(*domain.Job)
	if j.Type != "table" {
		return "", errors.New(port.ErrJobTypeNotImplemented)
	}
	cols, rows, err := c.getSource(repoSource, j)
	if err != nil {
		return "", err
	}
	if len(rows) == 0 {
		return "nothing to do", nil
	}
	getLen := len(rows)
	if rows, err = c.filterRefs(refs, cols, rows, repoTarget, txTarget); err != nil {
		return "", err
	}
	_, err = c.putSource(repoTarget, txTarget, c.mountInsert(j.Base, j.Object, cols, rows))
	if err != nil {
		return "", err
	}
	if err := c.setJob(j, cols, rows, repoTarget, txTarget); err != nil {
		return "", err
	}
	return fmt.Sprintf("%d rows processed, %d copied", getLen, len(rows)), nil
}

// filterRefs filters the references
func (c *Copy) filterRefs(refs map[string]port.Domain, cols []string, rows [][]*string, repo port.Repository, tx interface{}) ([][]*string, error) {
	colsMap := make(map[string]int)
	for i, col := range cols {
		colsMap[col] = i
	}
	for field, ref := range refs {
		min, max, err := c.getRefRange(field, colsMap, rows)
		if err != nil {
			return nil, err
		}
		iref := ref.(*domain.Job)
		if max > iref.Last {
			return nil, fmt.Errorf(port.ErrReferenceNotDone, iref.Name)
		}
		possibles, err := c.getRefPossibles(iref, repo, tx, min, max)
		if err != nil {
			return nil, err
		}
		rows, err = c.filterRef(field, possibles, colsMap, rows)
		if err != nil {
			return nil, err
		}
	}
	return rows, nil
}

// getRefPossibles gets the possible references
func (c *Copy) getRefPossibles(job *domain.Job, repoTarget port.Repository, txTarget interface{}, min int64, max int64) (map[int64]bool, error) {
	sql := fmt.Sprintf(sqlrow, job.Object, job.Field, min-1, job.Field, max, job.Field)
	cols, rows, err := repoTarget.Query(txTarget, sql)
	if err != nil {
		return nil, err
	}
	icol, err := c.getColumn(cols, job.Field)
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
func (c *Copy) getSource(repoSource port.Repository, j *domain.Job) ([]string, [][]*string, error) {
	txSource := repoSource.Begin(j.Base)
	defer repoSource.Rollback(txSource)
	sql := fmt.Sprintf(sqlrow, j.Object, j.Field, j.Last, j.Field, j.Last+limit, j.Field)
	cols, rows, err := repoSource.Query(txSource, sql)
	if err != nil {
		return nil, nil, err
	}
	return cols, rows, nil
}

// putSource puts the source data into the target
func (c *Copy) putSource(repoTarget port.Repository, txTarget interface{}, cmd string) (int64, error) {
	_, err := repoTarget.Exec(txTarget, disableFK)
	if err != nil {
		return 0, err
	}
	_, err = repoTarget.Exec(txTarget, cmd)
	if err != nil {
		return 0, err
	}
	done, err := repoTarget.Exec(txTarget, enableFK)
	if err != nil {
		return 0, err
	}
	return done, nil
}

// setJob sets the job last id
func (c *Copy) setJob(job *domain.Job, cols []string, rows [][]*string, repoTarget port.Repository, txTarget interface{}) error {
	last, err := c.getLast(cols, rows, job.Field)
	if err != nil {
		return err
	}
	job.Last = last
	if err := job.Save(repoTarget, txTarget); err != nil {
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
	return fmt.Sprintf(sqlinsert, base, tablename, strCols, values[:len(values)-2])
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
