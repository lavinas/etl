package domain

import (
	"errors"
	"strconv"

	"github.com/lavinas/vooo-etl/internal/port"
)

// Job represents the job entity of application
type Job struct {
	Id     int64    `gorm:"type:bigint(20); not null; primaryKey"`
	Name   string   `gorm:"type:varchar(100); not null"`
	Type   string   `gorm:"type:varchar(30); not null"`
	Action string   `gorm:"type:varchar(30); not null"`
	Base   string   `gorm:"type:varchar(255); not null"`
	Object string   `gorm:"type:varchar(255); not null"`
	Keys   []JobKey `gorm:"-"`
	Refs   []Ref    `gorm:"-"`
}

// GetAllOrdered gets all jobs ordered
func (j *Job) GetAll(repo port.Repository) (*[]Job, error) {
	tx := repo.Begin("")
	defer repo.Rollback(tx)
	jobs, _, err := repo.Find(tx, j, -1, false)
	if err != nil {
		return nil, err
	}
	if jobs == nil {
		return nil, errors.New(port.ErrJobsNotFound)
	}
	return jobs.(*[]Job), nil
}

// LoadLock loads the job entity with lock
func (j *Job) Load(repo port.Repository, tx interface{}, lock bool) error {
	if tx == nil {
		tx = repo.Begin("")
		defer repo.Rollback(tx)
	}
	id := strconv.FormatInt(j.Id, 10)
	if ok, err := repo.Get(tx, j, id, lock); err != nil {
		return err
	} else if !ok {
		return errors.New(port.ErrJobNotFound)
	}
	if err := j.loadDependencies(repo, tx); err != nil {
		return err
	}
	return nil
}

// SetKeysLast sets the last key of the job entity
func (j *Job) SetKeysLast(lasts []int64, repo port.Repository, tx interface{}) error {
	if len(j.Keys) != len(lasts) {
		return errors.New(port.ErrKeysLength)
	}
	for i, key := range j.Keys {
		if err := key.SetLast(lasts[i], repo, tx); err != nil {
			return err
		}
	}
	return nil
}

// TableName returns the table name of the job entity
func (j *Job) TableName() string {
	return "job"
}

// loadDependencies loads the job entity with dependencies
func (j *Job) loadDependencies(repo port.Repository, tx interface{}) error {
	jobKey := JobKey{}
	if keys, err := jobKey.FindByJobId(j.Id, repo, tx); err != nil {
		return err
	} else {
		j.Keys = keys
	}
	ref := Ref{}
	if refs, err := ref.FindByReferrer(j.Id, repo, tx); err != nil {
		return err
	} else {
		j.Refs = refs
	}
	return nil
}
