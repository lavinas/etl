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
func (r *Run) RunJob(jobId int64) (string, error) {
	exec := &domain.Exec{}
	if err := exec.Init(r.RepoTarget, jobId); err != nil {
		return "", err
	}
	var status, detail string
	if message, err := r.run(jobId); err != nil {
		status = "error"
		detail = err.Error()
	} else {
		status = "success"
		detail = message
	}
	if err := exec.SetStatus(r.RepoTarget, status, detail); err != nil {
		return "", err
	}
	if status == "error" {
		return "", errors.New(detail)
	}
	return detail, nil
}

// run runs the use case
func (r *Run) run(jobId int64) (string, error) {
	job := &domain.Job{Id: jobId}
	txTarget := r.RepoTarget.Begin("")
	defer r.RepoTarget.Rollback(txTarget)
	if err := job.LoadLock(r.RepoTarget, txTarget); err != nil {
		return "", err
	}
	action, ok := actionMap[job.Action]
	if !ok {
		return "", errors.New(port.ErrActionNotFound)
	}
	refs, err := r.getReferrences(jobId, r.RepoTarget, txTarget)
	if err != nil {
		return "", err
	}
	message, err := action.Run(job, refs, r.RepoSource, r.RepoTarget, txTarget)
	if err != nil {
		return "", err
	}
	if err := r.RepoTarget.Commit(txTarget); err != nil {
		return "", err
	}
	return message, nil
}

// getReferences gets the references of the job
func (r *Run) getReferrences(jobId int64, repoTarged port.Repository, tx interface{}) (map[string]port.Domain, error) {
	ref := &domain.Reference{Referrer: jobId}
	refs, err := ref.GetByReferrer(repoTarged, tx)
	if err != nil {
		return nil, err
	}
	if refs == nil {
		return nil, nil
	}
	jobs := make(map[string]port.Domain, len(*refs))
	for _, r := range *refs {
		jobs[r.Field] = &domain.Job{Id: *r.Referred}
		if err := jobs[r.Field].LoadLock(repoTarged, tx); err != nil {
			return nil, err
		}
	}
	return jobs, nil
}
