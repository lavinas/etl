package domain

import (
	"github.com/lavinas/vooo-etl/internal/port"
)

// Ref represents the reference entity of application
type Ref struct {
	Id       string   `gorm:"type:bigint; not null; primaryKey"`
	Referrer string   `gorm:"type:bigint; not null; primaryKey"`
	Referred string   `gorm:"type:bigint; not null; primaryKey"`
	Keys     []RefKey `gorm:"-"`
	Job      Job      `gorm:"-"`
}

// Find finds all refs based on the ref entity
func (r *Ref) Find(repo port.Repository, tx interface{}, lock bool) ([]Ref, error) {
	if tx == nil {
		tx = repo.Begin("")
		defer repo.Rollback(tx)
	}
	refs, _, err := repo.Find(tx, r, -1, lock)
	if err != nil {
		return nil, err
	}
	if refs == nil {
		return nil, nil
	}
	ret := []Ref{}
	iref := refs.(*[]Ref)
	for _, r := range *iref {
		if err := r.getDependencies(repo, tx); err != nil {
			return nil, err
		}
		ret = append(ret, r)
	}
	return ret, nil
}

// mountRerturn mounts the return value of the ref entity
func (r *Ref) getDependencies(repo port.Repository, tx interface{}) error {
	refKey := RefKey{RefId: r.Id}
	if keys, err := refKey.Find(repo, tx, false); err != nil {
		return err
	} else {
		r.Keys = keys
	}
	job := Job{Id: r.Referred}
	if err := job.Load(repo, tx, false); err != nil {
		return err
	}
	r.Job = job
	return nil
}

// TableName returns the table name of the ref entity
func (r *Ref) TableName() string {
	return "ref"
}
