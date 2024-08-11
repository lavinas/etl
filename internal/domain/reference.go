package domain

import (
	"errors"

	"github.com/lavinas/vooo-etl/internal/port"
)

// Reference represents the reference entity of application
type Reference struct {
	Referrer int64  `gorm:"type:bigint(20); not null; primaryKey"`
	Referred *int64  `gorm:"type:bigint(20); not null; primaryKey"`
	Field    string `gorm:"type:varchar(255); not null"`
}

// NewReference creates a new reference entity
func NewReference(referrer, referred int64) *Reference {
	return &Reference{
		Referrer: referrer,
		Referred: &referred,
	}
}

// LoadLock loads the job entity with lock
func (r *Reference) LoadLock(repo port.Repository, tx interface{}) error {
	refs, _, err := repo.Find(tx, r, -1, false)
	if err != nil {
		return err
	}
	ref := refs.([]*Reference)
	if len(ref) == 0 {
		return errors.New(port.ErrJobNotFound)
	}
	r.Referrer = ref[0].Referrer
	r.Referred = ref[0].Referred
	r.Field = ref[0].Field
	return nil
}

// LoadReferrer loads the referrer of the reference entity
func (r *Reference) GetByReferrer(repo port.Repository, tx interface{}) (*[]Reference, error) {
	refs, _, err := repo.Find(tx, r, -1, false)
	if err != nil {
		return nil, err
	}
	if refs == nil {
		return nil, errors.New(port.ErrReferenceNotFound)
	}
	return refs.(*[]Reference), nil
}

// TableName returns the table name of the reference entity
func (r *Reference) TableName() string {
	return "reference"
}
