package domain

import (
	"errors"
	"strconv"
	"time"

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
	Id     int64     `gorm:"type:bigint(20); not null; primaryKey"`
	Name   string    `gorm:"type:varchar(100); not null"`
	Type   string    `gorm:"type:varchar(30); not null"`
	Action string    `gorm:"type:varchar(30); not null"`
	Object string    `gorm:"type:varchar(255); not null"`
	Field  string    `gorm:"type:varchar(100); not null"`
	Last   int64     `gorm:"type:bigint(20); not null"`
	Status string    `gorm:"type:varchar(20); not null"`
	Lock   time.Time `gorm:"type:datetime; not null"`
}

// NewJob creates a new job entity
func NewJob(id int64, name, jobType, action, object, field string, last int64, status string, lock time.Time) *Job {
	return &Job{
		Id:     id,
		Name:   name,
		Type:   jobType,
		Action: action,
		Object: object,
		Field:  field,
		Last:   last,
		Status: status,
		Lock:   lock,
	}
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

// SetRunning sets the job status to running
func (j *Job) SetRunning(repo port.Repository) error {
	if j.Status != JobStatusReady {
		return errors.New(port.ErrJobNotReady)
	}
	if err := j.setStatus(repo, JobStatusRunning); err != nil {
		return err
	}
	return nil
}

// SerReady sets the job status to ready
func (j *Job) SetReady(repo port.Repository) error {
	if j.Status != JobStatusRunning {
		return errors.New(port.ErrJobNotRunning)
	}
	if err := j.setStatus(repo, JobStatusReady); err != nil {
		return err
	}
	return nil
}

// TableName returns the table name of the job entity
func (j *Job) TableName() string {
	return "job"
}

// setStatus sets the job status
func (j *Job) setStatus(repo port.Repository, status string) error {
	j.Status = status
	tx := repo.Begin("")
	defer repo.Rollback(tx)
	if err := repo.Save(tx, j); err != nil {
		return err
	}
	if err := repo.Commit(tx); err != nil {
		return err
	}
	return nil
}
