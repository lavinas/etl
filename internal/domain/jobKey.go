package domain

import (
	"github.com/lavinas/vooo-etl/internal/port"
)

// JobKey represents the key entity of jobs
type JobKey struct {
	Id    string `gorm:"type:bigint; not null; primaryKey"`
	JobId string `gorm:"type:bigint; not null; index"`
	Name  string `gorm:"type:varchar(100); not null"`
	Last  string `gorm:"type:bigint; not null"`
	Step  string `gorm:"type:bigint; not null"`
}

// Find finds all job keys based on the job key entity
func (j *JobKey) Find(repo port.Repository, tx interface{}, lock bool) ([]JobKey, error) {
	if tx == nil {
		tx = repo.Begin("")
		defer repo.Rollback(tx)
	}
	jobKeys, _, err := repo.Find(tx, j, -1, lock)
	if err != nil {
		return nil, err
	}
	if jobKeys == nil {
		return nil, nil
	}
	ret := []JobKey{}
	keys := jobKeys.(*[]JobKey)
	ret = append(ret, *keys...)
	return ret, nil
}

// TableName returns the table name of the job key entity
func (j *JobKey) TableName() string {
	return "job_key"
}
