package domain

import (
	"github.com/lavinas/vooo-etl/internal/port"
)

// Ref represents the reference entity of application
type Ref struct {
	Id       int64    `gorm:"type:bigint; not null; primaryKey"`
	Referrer int64    `gorm:"type:bigint; not null"`
	Referred int64    `gorm:"type:bigint; not null"`
	Keys     []RefKey `gorm:"-"`
	Job      Job      `gorm:"-"`
}

// NewRef creates a new ref entity
func NewRef(id, referrer, referred int64) *Ref {
	return &Ref{
		Id:       id,
		Referrer: referrer,
		Referred: referred,
	}
}

// Find finds all refs based on the ref entity
func (r *Ref) FindByReferrer(referrer int64, repo port.Repository, tx interface{}) ([]Ref, error) {
	if tx == nil {
		tx = repo.Begin("")
		defer repo.Rollback(tx)
	}
	ref := Ref{Referrer: referrer, Id: port.Int64Nil, Referred: port.Int64Nil}
	refs, _, err := repo.Find(tx, &ref, -1, false)
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

// Save saves the ref entity
func (r *Ref) Save(repo port.Repository, tx interface{}) error {
	if err := repo.Save(tx, r); err != nil {
		return err
	}
	return nil
}

// mountRerturn mounts the return value of the ref entity
func (r *Ref) getDependencies(repo port.Repository, tx interface{}) error {
	refKey := RefKey{}
	if keys, err := refKey.FindByRefId(r.Id, repo, tx); err != nil {
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
