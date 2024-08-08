package usecase

import (
	"errors"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

var (
	// actionMap is a map that represents the actions to run
	actionMap = map[string]port.RunAction{
		"loadClient": NewLoadClient(),
		"copy":       NewCopy(),
	}
)

// Run is a struct that represents the use case
type Run struct {
	RepoSource port.Repository
	RepoTarget port.Repository
}

// NewRun creates a new use case
func NewRun(repoSource port.Repository, repoTarget port.Repository) *Run {
	return &Run{RepoSource: repoSource, RepoTarget: repoTarget}
}

// Run runs the use case
func (r *Run) RunJob(jobId int64) error {
	exec := &domain.Exec{}
	if err := exec.Init(r.RepoTarget, jobId); err != nil {
		return err
	}
	var status, detail string
	if err := r.run(jobId); err != nil {
		status = "error"
		detail = err.Error()
	} else {
		status = "success"
	}
	if err := exec.SetStatus(r.RepoTarget, status, detail); err != nil {
		return err
	}
	return nil
}

// run runs the use case
func (r *Run) run(jobId int64) error {
	job := &domain.Job{Id: jobId}
	tx := r.RepoTarget.Begin("")
	defer r.RepoTarget.Rollback(tx)
	if err := job.LoadLock(r.RepoTarget, tx); err != nil {
		return err
	}
	action, ok := actionMap[job.Action]
	if !ok {
		return errors.New(port.ErrActionNotFound)
	}
	if err := action.Run(job, r.RepoSource, r.RepoTarget); err != nil {
		return err
	}
	if err := r.RepoTarget.Commit(tx); err != nil {
		return err
	}
	return nil
}
