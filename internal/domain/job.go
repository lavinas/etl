package domain

import (
	"time"

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

// TableName returns the table name of the job entity
func (j *Job) TableName() string {
	return "job"
}
