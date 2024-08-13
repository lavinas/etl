package usecase

import (
	"errors"
	"fmt"
	"time"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

// Run is a struct that represents the use case
type Run struct {
	Base
}

// NewRun creates a new use case
func NewRun(repoSource port.Repository, repoTarget port.Repository) *Run {
	return &Run{
		Base: Base{
			RepoSource: repoSource,
			RepoTarget: repoTarget,
		},
	}
}

// Run runs the use case
func (r *Run) RunJob(jobId int64) (string, error) {
	exec := &domain.Exec{}
	if err := exec.Init(r.RepoTarget, jobId); err != nil {
		return "", err
	}
	now := time.Now()
	var status, detail string
	var miss int64
	if message, m, err := r.run(jobId); err != nil {
		status = "error"
		detail = err.Error()
		miss = -1
	} else {
		status = "success"
		detail = message
		miss = m
	}
	dur := time.Since(now).Seconds()
	if err := exec.SetStatus(r.RepoTarget, status, detail, miss, dur); err != nil {
		return "", err
	}
	if status == "error" {
		return "", errors.New(detail)
	}
	detail = fmt.Sprintf("%s in %.4f seconds", detail, dur)
	return detail, nil
}

// run runs the use case
func (r *Run) run(jobId int64) (string, int64, error) {
	job := &domain.Job{Id: jobId}
	txTarget := r.RepoTarget.Begin("")
	defer r.RepoTarget.Rollback(txTarget)
	if err := job.LoadLock(r.RepoTarget, txTarget); err != nil {
		return "", -1, err
	}
	refs, err := r.getReferences(jobId, txTarget)
	if err != nil {
		return "", -1, err
	}
	action, err := r.factory(job.Action)
	if err != nil {
		return "", -1, err
	}
	message, missing, err := action.Run(job, refs, txTarget)
	if err != nil {
		return "", -1, err
	}
	if err := r.RepoTarget.Commit(txTarget); err != nil {
		return "", -1, err
	}
	return message, missing, nil
}

// getReferences gets the references of the job
func (r *Run) getReferences(jobId int64, tx interface{}) ([]References, error) {
	ref := &domain.Reference{Referrer: jobId}
	refs, err := ref.GetByReferrer(r.RepoTarget, tx)
	if err != nil {
		return nil, err
	}
	if refs == nil {
		return nil, nil
	}
	ret := make([]References, len(*refs))
	for i, re := range *refs {
		j := &domain.Job{Id: *re.Referred}
		if err := j.LoadLock(r.RepoTarget, tx); err != nil {
			return nil, err
		}
		ret[i] = References{Id: j.Id, Name: j.Name, Base: j.Base, Object: j.Object, Last: j.Last,
			FieldReferrer: re.FieldReferrer, FieldReferred: re.FieldReferred}
	}
	return ret, nil
}

// factoryAction creates a new action use case
func (r *Run) factory(action string) (port.RunAction, error) {
	switch action {
	case "loadClient":
		return NewLoadClient(r.RepoSource, r.RepoTarget), nil
	case "copy":
		return NewCopy(r.RepoSource, r.RepoTarget), nil
	}
	return nil, errors.New(port.ErrActionNotFound)
}
