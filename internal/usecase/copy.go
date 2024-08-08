package usecase

import (
	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

// Copy is a struct that represents the use case copy a object from database to another
type Copy struct {
}

// NewCopy creates a new use case
func NewCopy() *Copy {
	return &Copy{}
}

// Run runs the use case
func (c *Copy) Run(job *domain.Job, repo port.Repository) error {
	return nil
}
