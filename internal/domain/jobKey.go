package domain

import (
	"github.com/lavinas/vooo-etl/internal/port"
)

// JobKey represents the key entity of jobs
type JobKey struct {
	Id    int64  `gorm:"type:bigint; not null; primaryKey"`
	JobId int64  `gorm:"type:bigint; not null; index"`
	Name  string `gorm:"type:varchar(100); not null"`
	Last  int64  `gorm:"type:bigint; not null"`
	Step  int64  `gorm:"type:bigint; not null"`
}

// NewJobKey creates a new job key entity
func NewJobKey(id, jobId, last, step int64, name string) *JobKey {
	return &JobKey{
		Id:    id,
		JobId: jobId,
		Name:  name,
		Last:  last,
		Step:  step,
	}
}

// Find finds all job keys based on the job key entity
func (j *JobKey) FindByJobId(jobId int64, repo port.Repository, tx interface{}) ([]JobKey, error) {
	key := JobKey{JobId: jobId, Id: port.Int64Nil, Last: port.Int64Nil, Step: port.Int64Nil}
	jobKeys, _, err := repo.Find(tx, &key, -1, false)
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

// Save saves the job key entity
func (j *JobKey) Save(repo port.Repository, tx interface{}) error {
	if err := repo.Save(tx, j); err != nil {
		return err
	}
	return nil
}

// SetLast sets the last key of the job key entity
func (j *JobKey) SetLast(last int64, repo port.Repository, tx interface{}) error {
	j.Last = last
	if err := repo.Save(tx, j); err != nil {
		return err
	}
	return nil
}

// ResetLast resets the last key of the job key entity
func (j *JobKey) ResetLast(repo port.Repository, tx interface{}) error {
	j.Last = -1
	return j.SetLast(j.Last, repo, tx)
}

// TableName returns the table name of the job key entity
func (j *JobKey) TableName() string {
	return "job_key"
}
