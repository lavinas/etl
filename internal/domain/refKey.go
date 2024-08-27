package domain

import (
	"github.com/lavinas/vooo-etl/internal/port"
)

// RefKey represents the key entity of references
type RefKey struct {
	Id       int64  `gorm:"type:bigint(20); not null; primaryKey"`
	RefId    int64  `gorm:"type:bigint(20); not null; index"`
	Referrer string `gorm:"type:varchar(100); not null"`
	Referred string `gorm:"type:varchar(100); not null"`
}

// NewRefKey creates a new ref key entity
func NewRefKey(id, refId int64, referrer, referred string) *RefKey {
	return &RefKey{
		Id:       id,
		RefId:    refId,
		Referrer: referrer,
		Referred: referred,
	}
}


// Find finds all ref keys based on the ref key entity
func (r *RefKey) FindByRefId(refId int64, repo port.Repository, tx interface{}) ([]RefKey, error) {
	if tx == nil {
		tx = repo.Begin("")
		defer repo.Rollback(tx)
	}
	rk := RefKey{RefId: refId, Id: port.Int64Nil}
	refKeys, _, err := repo.Find(tx, &rk, -1, false)
	if err != nil {
		return nil, err
	}
	if refKeys == nil {
		return nil, nil
	}
	ret := []RefKey{}
	keys := refKeys.(*[]RefKey)
	ret = append(ret, *keys...)
	return ret, nil
}

// Save saves the ref key entity
func (r *RefKey) Save(repo port.Repository, tx interface{}) error {
	if err := repo.Save(tx, r); err != nil {
		return err
	}
	return nil
}

// TableName returns the table name of the ref key entity
func (r *RefKey) TableName() string {
	return "ref_key"
}
