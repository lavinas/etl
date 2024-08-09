package domain

import (
	"errors"
	"strconv"

	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	// JobStatusReady represents the ready status of a job
	JobStatusReady = "ready"
	// JobStatusRunning represents the running status of a job
	JobStatusRunning = "running"
)

// Job represents the job entity of application
type Job struct {
	Id     int64  `gorm:"type:bigint(20); not null; primaryKey"`
	Name   string `gorm:"type:varchar(100); not null"`
	Type   string `gorm:"type:varchar(30); not null"`
	Base   string `gorm:"type:varchar(255); not null"`
	Action string `gorm:"type:varchar(30); not null"`
	Object string `gorm:"type:varchar(255); not null"`
	Field  string `gorm:"type:varchar(100); not null"`
	Last   int64  `gorm:"type:bigint(20); not null"`
}

// Load loads the job entity
func (j *Job) Load(repo port.Repository) error {
	tx := repo.Begin("")
	defer repo.Rollback(tx)
	if ok, err := repo.Get(tx, j, strconv.FormatInt(j.Id, 10), false); err != nil {
		return err
	} else if !ok {
		return errors.New(port.ErrJobNotFound)
	}
	return nil
}

// LoadLock loads the job entity with lock
func (j *Job) LoadLock(repo port.Repository, tx interface{}) error {
	if ok, err := repo.Get(tx, j, strconv.FormatInt(j.Id, 10), true); err != nil {
		return err
	} else if !ok {
		return errors.New(port.ErrJobNotFound)
	}
	return nil
}

// TableName returns the table name of the job entity
func (j *Job) TableName() string {
	return "job"
}
