package domain

import (
	"errors"
	"strconv"
	"time"

	"github.com/lavinas/vooo-etl/internal/port"
)

type Exec struct {
	Id     int64      `gorm:"type:bigint(20); not null; primaryKey"`
	JobId  int64      `gorm:"type:bigint(20); not null"`
	Start  time.Time  `gorm:"type:datetime; not null"`
	End    *time.Time `gorm:"type:datetime; null"`
	Status string     `gorm:"type:varchar(20); not null"`
	Detail string     `gorm:"type:text; not null"`
}

// Init initializes the log entity
func (l *Exec) Init(repo port.Repository, jobId int64) error {
	l.Start = time.Now()
	l.Status = "running"
	l.Detail = ""
	l.JobId = jobId
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

// LoadLock loads the job entity with lock
func (l *Exec) LoadLock(repo port.Repository, tx interface{}) error {
	if ok, err := repo.Get(tx, l, strconv.FormatInt(l.Id, 10), true); err != nil {
		return err
	} else if !ok {
		return errors.New(port.ErrJobNotFound)
	}
	return nil
}

// SetStatus sets the status of the log entity
func (l *Exec) SetStatus(repo port.Repository, status string, detail string) error {
	now := time.Now()
	l.End = &now
	l.Status = status
	l.Detail = detail
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
func (l *Exec) TableName() string {
	return "exec"
}
