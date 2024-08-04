package domain

// Reference represents the reference entity of application
type Reference struct {
	Referrer int64 `gorm:"type:bigint(20); not null; primaryKey"`
	Referred int64 `gorm:"type:bigint(20); not null; primaryKey"`
}
