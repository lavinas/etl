package usecase

import (
	"context"
	"os"

	"github.com/lavinas/vooo-etl/internal/port"
)


type References struct {
	Id            int64
	Name          string
	Base          string
	Object        string
	Field         string
	Last          int64
	Limit         int64
	FieldReferrer string
	FieldReferred string
}

// Base is a struct that represents the base use case
type Base struct {
	RepoSource port.Repository
	RepoTarget port.Repository
	Ctx        context.Context
	Signal     chan os.Signal
}

// NewBase creates a new use case
func NewBase(repoSource port.Repository, repoTarget port.Repository) *Base {
	return &Base{RepoSource: repoSource, RepoTarget: repoTarget}
}
