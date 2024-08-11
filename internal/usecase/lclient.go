package usecase

import (
	"errors"
	"fmt"
	"strconv"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	loadClientLimit = 5000
	loadClientSourceBase = "vooo_prod_backend"
	loadClientAggregator = "SELECT id FROM aggregator_ref;"
	loadClientSelect = "SELECT id FROM client WHERE id_aggregator in (%s) and id > %d and id <= %d order by id;"
	loadClientInsert = "INSERT INTO client_ref VALUES %s;"
	loadClientMax = "SELECT max(id) FROM client;"

)

// Copy is a struct that represents the use case copy a object from database to another
type LoadClient struct {	
}

// NewCopy creates a new use case
func NewLoadClient() *LoadClient {
	return &LoadClient{}
}

// Run runs the use case
func (c *LoadClient) Run(job port.Domain, refs map[string]port.Domain, repoSource port.Repository, repoTarget port.Repository, txTarget interface{}) (string, error) {
	j := job.(*domain.Job)
	if j.Type != "table" {
		return "", errors.New(port.ErrJobTypeNotImplemented)
	}
	aggregators, err := c.getAggregators(repoTarget, txTarget)
	if err != nil {
		return "", err
	}
	ids, err := c.getSource(aggregators, j.Last, j.Last + loadClientLimit, repoSource)
	if err != nil {
		return "", err
	}
	if len(ids) == 0 {
		return "0 processed", nil
	}
	if err := c.insertTarget(ids, repoTarget, txTarget); err != nil {
		return "", err
	}
	processed, err := c.setJob(j, repoSource, repoTarget, txTarget)
	if err != nil {
		return "", err
	}
	return fmt.Sprintf("%d processed, %d copied ", processed, len(ids)), nil
}

// getAggregators gets the aggregators from reference table
func (c *LoadClient) getAggregators(repo port.Repository, tx interface{}) (string, error) {
    _, rows, err := repo.Query(tx, loadClientAggregator)
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
func (c *LoadClient) getSource(aggregators string, initId int64, endId int64, repo port.Repository) ([][]*string, error) {
	tx := repo.Begin(loadClientSourceBase)
	defer repo.Rollback(tx)
	query := fmt.Sprintf(loadClientSelect, aggregators, initId, endId)
	_, rows, err := repo.Query(tx, query)
	if err != nil {
		return nil, err
	}
	return rows, nil
}

// insertTarget inserts the data into the target database
func (c *LoadClient) insertTarget(rows [][]*string, repo port.Repository, tx interface{}) error {
	clis := ""
	for _, row := range rows {
		clis += fmt.Sprintf("(%s),", *row[0])
	}
	clis = clis[:len(clis)-1]
	query := fmt.Sprintf(loadClientInsert, clis)
	_, err := repo.Exec(tx, query)
	if err != nil {
		return err
	}
	return nil
}

// setJob sets the job with the last id processed
func (c *LoadClient) setJob(job *domain.Job, repoSource port.Repository, repoTarget port.Repository, tx interface{}) (int64, error) {
	last := job.Last + loadClientLimit
	max, err := c.getMaxClient(repoSource)
	if err != nil {
		return 0, err
	}
	if last > max {
		last = max
	}
	processed := last - job.Last
	job.Last = last
	if err := job.Save(repoTarget, tx); err != nil {
		return 0, err
	}
	return processed, nil
}

// getMaxClient gets the max id from the client table
func (c *LoadClient) getMaxClient(repoSource port.Repository) (int64, error) {
	tx := repoSource.Begin(loadClientSourceBase)
	defer repoSource.Rollback(tx)
	_, rows, err := repoSource.Query(tx, loadClientMax)
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