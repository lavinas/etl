package usecase

import (
	"os"

	"github.com/lavinas/vooo-etl/internal/port"
)

// UseCase is a struct that represents the use case
type UseCase struct {
	Base
}

// NewUseCase creates a new use case
func NewUseCase(repoSource port.Repository, repoTarget port.Repository, signal chan os.Signal) *UseCase {
	return &UseCase{
		Base: Base{
			RepoSource: repoSource,
			RepoTarget: repoTarget,
			Signal:     signal,
		},
	}
}

// SetUp runs the mount operation
func (m *UseCase) SetUp(in *port.SetUpIn, out chan *port.SetUpOut) {
	if in == nil || out == nil {
		panic("Setup: Invalid input parameters")
	}
	setUp := NewSetUp(m.RepoSource, m.RepoTarget, m.Signal)
	setUp.Run(in, out)
}

// Run runs app with given parameters
func (r *UseCase) Run(in *port.RunIn, out chan *port.RunOut) {
	if in == nil || out == nil {
		panic("Run: Invalid input parameters")
	}
	run := NewRun(r.RepoSource, r.RepoTarget, r.Signal)
	run.Run(in, out)
}

// Truncate runs app with given parameters
func (t *UseCase) Truncate(in *port.TruncateIn, out chan *port.TruncateOut) {
	if in == nil || out == nil {
		panic("Truncate: Invalid input parameters")
	}
	truncate := NewTruncate(t.RepoSource, t.RepoTarget, t.Signal)
	truncate.Run(in, out)
}
