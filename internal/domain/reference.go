package domain

// Reference represents the reference entity of application
type Reference struct {
	Referrer int64 `gorm:"type:bigint(20); not null; primaryKey"`
	Referred int64 `gorm:"type:bigint(20); not null; primaryKey"`
}

// NewReference creates a new reference entity
func NewReference(referrer, referred int64) *Reference {
	return &Reference{
		Referrer: referrer,
		Referred: referred,
	}
}

// TableName returns the table name of the reference entity
func (r *Reference) TableName() string {
	return "reference"
}