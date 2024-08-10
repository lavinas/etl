package domain

import (
	"github.com/lavinas/vooo-etl/internal/port"
)	

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

// LoadReferrer loads the referrer of the reference entity
func (r *Reference) GetByReferrer(repo port.Repository, tx interface{}) ([]*Reference, error) {
	refs, _, err := repo.Find(tx, r, -1, false)
	if err != nil {
		return nil, err
	}
	return refs.([]*Reference), nil
}

// TableName returns the table name of the reference entity
func (r *Reference) TableName() string {
	return "reference"
}
