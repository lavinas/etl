package usecase

import (
	"errors"
	"fmt"
	"strconv"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

// Copy is a struct that represents the use case copy a object from database to another
type LoadClient struct {
	Base
}

// Run runs the use case
func (c *LoadClient) Run(job port.Domain, refs interface{}, txTarget interface{}) (string, int64, error) {
	j := job.(*domain.Job)
	if j.Type != "table" {
		return "", -1, errors.New(port.ErrJobTypeNotImplemented)
	}
	aggregators, err := c.getAggregators(txTarget)
	if err != nil {
		return "", -1, err
	}
	ids, err := c.getSource(aggregators, j.Last, j.Last+j.Limit)
	if err != nil {
		return "", -1, err
	}
	if err := c.insertTarget(ids, txTarget); err != nil {
		return "", -1, err
	}
	processed, missing, err := c.setJob(j, txTarget)
	if err != nil {
		return "", -1, err
	}
	return fmt.Sprintf("%d processed, %d copied, missing %d ", processed, len(ids), missing), missing, nil
}

// getAggregators gets the aggregators from reference table
func (c *LoadClient) getAggregators(txTarget interface{}) (string, error) {
	_, rows, err := c.RepoTarget.Query(txTarget, port.LoadClientAggregator)
	if err != nil {
		return "", err
	}
	list := ""
	for _, row := range rows {
		list += fmt.Sprintf("%s,", *row[0])
	}
	if len(list) == 1 {
		return "", errors.New(port.ErrAggregatorNotFound)
	}
	return list[:len(list)-1], nil
}

// getSource gets the source data from the database
func (c *LoadClient) getSource(aggregators string, initId int64, endId int64) ([][]*string, error) {
	tx := c.RepoSource.Begin(port.LoadClientSourceBase)
	defer c.RepoSource.Rollback(tx)
	query := fmt.Sprintf(port.LoadClientSelect, aggregators, initId, endId)
	_, rows, err := c.RepoSource.Query(tx, query)
	if err != nil {
		return nil, err
	}
	return rows, nil
}

// insertTarget inserts the data into the target database
func (c *LoadClient) insertTarget(rows [][]*string, txTarget interface{}) error {
	if len(rows) == 0 {
		return nil
	}
	clis := ""
	for _, row := range rows {
		clis += fmt.Sprintf("(%s),", *row[0])
	}
	clis = clis[:len(clis)-1]
	query := fmt.Sprintf(port.LoadClientInsert, clis)
	_, err := c.RepoTarget.Exec(txTarget, query)
	if err != nil {
		return err
	}
	return nil
}

// setJob sets the job with the last id processed
func (c *LoadClient) setJob(job *domain.Job, txTarget interface{}) (int64, int64, error) {
	last := job.Last + job.Limit
	max, err := c.getMaxClient()
	if err != nil {
		return -1, -1, err
	}
	if last > max {
		last = max
	}
	processed := last - job.Last
	missing := max - last
	job.Last = last
	if err := job.Save(c.RepoTarget, txTarget); err != nil {
		return -1, -1, err
	}
	return processed, missing, nil
}

// getMaxClient gets the max id from the client table
func (c *LoadClient) getMaxClient() (int64, error) {
	tx := c.RepoSource.Begin(port.LoadClientSourceBase)
	defer c.RepoSource.Rollback(tx)
	_, rows, err := c.RepoSource.Query(tx, port.LoadClientMax)
	if err != nil {
		return 0, err
	}
	if len(rows) == 0 || rows[0] == nil {
		return 0, errors.New(port.ErrFieldNotFound)
	}
	max, err := strconv.ParseInt(*rows[0][0], 10, 64)
	if err != nil {
		return 0, err
	}
	return max, nil
}
