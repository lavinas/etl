package domain

import "time"

type Log struct {
	Id     int64     `gorm:"type:bigint(20); not null; primaryKey"`
	JobId  int64     `gorm:"type:bigint(20); not null"`
	Start  time.Time `gorm:"type:datetime; not null"`
	End    time.Time `gorm:"type:datetime; not null"`
	Status string    `gorm:"type:varchar(20); not null"`
	Detail string    `gorm:"type:text; not null"`
}

// NewLog creates a new log entity
func NewLog(id, jobId int64, start, end time.Time, status, detail string) *Log {
	return &Log{
		Id:     id,
		JobId:  jobId,
		Start:  start,
		End:    end,
		Status: status,
		Detail: detail,
	}
}

// TableName returns the table name of the log entity
func (l *Log) TableName() string {
	return "log"
}
