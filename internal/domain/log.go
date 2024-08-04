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
