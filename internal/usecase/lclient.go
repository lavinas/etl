package usecase

import (
	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

// Copy is a struct that represents the use case copy a object from database to another
type LoadClient struct {
}

// NewCopy creates a new use case
func NewLoadClient() *Copy {
	return &Copy{}
}

// Run runs the use case
func (c *LoadClient) Run(job *domain.Job, repoSource port.Repository, repoTarget port.Repository) error {
	return nil
}
