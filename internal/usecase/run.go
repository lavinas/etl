package usecase

import (
	"errors"
	"fmt"
	"time"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	success       = "%s in %.4f seconds"
	errorStatus   = "error"
	successStatus = "success"
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

// Run runs app with given parameters
func (r *Run) Run(args port.Args) (string, error) {
	params := args.GetParams()
	if jobId, ok := params["JobID"]; ok {
		message, _, err := r.runJob(jobId.(int64))
		return message, err
	}
	return r.runAll()
}

// runAll runs all jobs in sequence
func (r *Run) runAll() (string, error) {
	job := &domain.Job{}
	jobs, err := job.GetAll(r.RepoTarget)
	if err != nil {
		return "", err
	}
	for _, j := range *jobs {
		_, err := r.runUntil(&j)
		if err != nil {
			return "", err
		}
	}
	return "not implemented", nil
}

// runUntil runs all jobs until finish all registers
func (r *Run) runUntil(job *domain.Job) (string, error) {
	fmt.Println(job)
	return "", nil
}

// Run runs a Job with a given id
func (r *Run) runJob(jobId int64) (string, int64, error) {
	exec := &domain.Exec{}
	if err := exec.Init(r.RepoTarget, jobId); err != nil {
		return "", -1, err
	}
	status, detail, miss, dur := r.runPrepare(jobId)
	if err := exec.SetStatus(r.RepoTarget, status, detail, miss, dur); err != nil {
		return "", -1, err
	}
	if status == "error" {
		return "", -1, errors.New(detail)
	}
	detail = fmt.Sprintf(success, detail, dur)
	return detail, miss, nil
}

// runJob runs a job with a given id and returns the status, detail, missing and duration
func (r *Run) runPrepare(jobId int64) (string, string, int64, float64) {
	now := time.Now()
	var status, detail string
	var miss int64
	if message, m, err := r.runAtomic(jobId); err != nil {
		status = errorStatus
		detail = err.Error()
		miss = -1
	} else {
		status = successStatus
		detail = message
		miss = m
	}
	dur := time.Since(now).Seconds()
	return status, detail, miss, dur
}

// run runs the use case
func (r *Run) runAtomic(jobId int64) (string, int64, error) {
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
