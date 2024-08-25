package domain

import (
	"time"

	"github.com/lavinas/vooo-etl/internal/port"
)

type Log struct {
	Id       int64     `gorm:"type:bigint; not null; primaryKey"`
	JobId    int64     `gorm:"type:bigint; not null"`
	Shift    int64     `gorm:"type:bigint; not null"`
	Status   string    `gorm:"type:varchar(20); not null"`
	Detail   string    `gorm:"type:text; not null"`
	Start    time.Time `gorm:"type:datetime; not null"`
	Duration float64   `gorm:"type:decimal(10,4); not null"`
	More     int64     `gorm:"type:bigint; not null"`
}

// Init initializes the log entity
func (l *Log) Init(repo port.Repository, jobId int64, start time.Time, shift int64) error {
	l.JobId = jobId
	l.Shift = shift
	l.Status = "running"
	l.Start = start
	l.Duration = -1
	l.More = -1
	tx := repo.Begin("")
	defer repo.Rollback(tx)
	if err := repo.Add(tx, l); err != nil {
		return err
	}
	if err := repo.Commit(tx); err != nil {
		return err
	}
	return nil
}

// SetStatus sets the status of the log entity
func (l *Log) SetStatus(repo port.Repository, out *port.RunOut) error {
	l.Status = out.Status
	l.Detail = out.Detail
	l.Duration = out.Duration
	l.More = out.More
	tx := repo.Begin("")
	defer repo.Rollback(tx)
	if err := repo.Save(tx, l); err != nil {
		return err
	}
	if err := repo.Commit(tx); err != nil {
		return err
	}
	return nil
}

// TableName returns the table name of the log entity
func (l *Log) TableName() string {
	return "log"
}
