package usecase

import (
	"errors"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

var (
	// actionMap is a map that represents the actions to run
	actionMap = map[string]RunAction{
		"copy": NewCopy(),
	}
)

// RunAction is a interface that represents the action to run
type RunAction interface {
	Run(*domain.Job, port.Repository) error
}

// Run is a struct that represents the use case
type Run struct {
	Repo port.Repository
}

// NewRun creates a new use case
func NewRun(repo port.Repository) *Run {
	return &Run{Repo: repo}
}

// Run runs the use case
func (r *Run) RunJob(jobId int64) error {
	// get the job
	job := &domain.Job{Id: jobId}
	if err := job.Load(r.Repo); err != nil {
		return err
	}
	if err := job.SetRunning(r.Repo); err != nil {
		return err
	}
	if action, err := r.runFactory(job); err != nil {
		return err
	} else if err := action.Run(job, r.Repo); err != nil {
		return err
	}
	if err := job.SetReady(r.Repo); err != nil {
		return err
	}
	return nil
}

// actionFactory is a method that creates a action
func (r *Run) runFactory(job *domain.Job) (RunAction, error) {
	if action, ok := actionMap[job.Action]; ok {
		return action, nil
	}
	return nil, errors.New(port.ErrJobNotReady)
}
