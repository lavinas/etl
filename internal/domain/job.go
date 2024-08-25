package domain

import (
	"errors"
	"strconv"

	"github.com/lavinas/vooo-etl/internal/port"
)

// Job represents the job entity of application
type Job struct {
	Id     int64   `gorm:"type:bigint(20); not null; primaryKey"`
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
	jobKey := JobKey{JobId: j.Id}
	if keys, err := jobKey.Find(repo, tx, false); err != nil {
		return err
	} else {
		j.Keys = keys
	}
	ref := Ref{Referrer: j.Id}
	if refs, err := ref.Find(repo, tx, false); err != nil {
		return err
	} else {
		j.Refs = refs
	}
	return nil
}

// Save saves the job entity
func (j *Job) Save(repo port.Repository, tx interface{}) error {
	return repo.Save(tx, j)
}

// TableName returns the table name of the job entity
func (j *Job) TableName() string {
	return "job"
}
