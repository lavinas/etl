package usecase

import (
	"context"
	"errors"
	"fmt"
	"os"
	"time"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	success       = "%s in %.4f seconds"
	errorStatus   = "error"
	successStatus = "success"
	channelEnd    = "<end>"
	runTimeout    = 5 * time.Second
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
func (r *Run) Run(args port.Args, signal chan os.Signal, retMessage chan string) error {
	defer r.finishRun(retMessage, time.Now())
	jobId, shifts := r.getArgs(args)
	jobs, err := r.getJobsId(jobId, r.RepoTarget)
	if err != nil {
		message := fmt.Sprintf("error: %s", err.Error())
		r.sendMessage(retMessage, message)
		return errors.New(message)
	}
	for _, j := range *jobs {
		err := r.runUntil(&j, signal, retMessage, shifts)
		if err != nil {
			return err
		}
	}
	return nil
}

// getArgs gets the arguments
func (r *Run) getArgs(args port.Args) (int64, int64) {
	params := args.GetParams()
	var jobId, shifts int64
	if id, ok := params["JobID"]; ok {
		jobId = id.(int64)
	} else {
		jobId = -1
	}
	if s, ok := params["Shifts"]; ok {
		shifts = s.(int64)
	} else {
		shifts = -1

	}
	return jobId, shifts
}

// getJobsId
func (r *Run) getJobsId(jobId int64, repo port.Repository) (*[]domain.Job, error) {
	job := domain.Job{}
	if jobId != -1 {
		job.Id = jobId
		if err := job.Load(repo); err != nil {
			return nil, err
		}
		return &[]domain.Job{job}, nil
	}
	jobs, err := job.GetAll(repo)
	if err != nil {
		return nil, err
	}
	return jobs, err
}

// finishRun finishes the run
func (r *Run) finishRun(messageChan chan string, start time.Time) {
	message := fmt.Sprintf("executed in %.4f seconds", time.Since(start).Seconds())
	r.sendMessage(messageChan, message)
	r.sendMessage(messageChan, channelEnd)
}

// runUntil runs all jobs until finish all registers
func (r *Run) runUntil(job *domain.Job, signal chan os.Signal, retMessage chan string, shifts int64) error {
	count := int64(1)
	for {
		start := time.Now()
		message, missing, err := r.runJob(job.Id, signal)
		exect := time.Since(start).Seconds()
		if err != nil {
			message = fmt.Sprintf("%d (%s): Error: %s in %.4f seconds", job.Id, job.Name, err.Error(), exect)
			r.sendMessage(retMessage, message)
			return errors.New(message)
		}
		message = fmt.Sprintf("%d (%s): Ok: %s - shift %d in %.4f seconds", job.Id, job.Name, message, count, exect)
		r.sendMessage(retMessage, message)
		if missing == 0 || (shifts != -1 && count >= shifts) {
			break
		}
		count++
	}
	return nil
}

// sendMessage sends a message to the channel
func (r *Run) sendMessage(retMessage chan string, message string) {
	if retMessage != nil {
		retMessage <- message
	}
}

// RunReturn is a struct that represents the return of the Run
type runReturn struct {
	status   string
	detail   string
	missing  int64
	duration float64
}

// Run runs a Job with a given id
func (r *Run) runJob(jobId int64, signal chan os.Signal) (string, int64, error) {
	exec := &domain.Exec{}
	if err := exec.Init(r.RepoTarget, jobId); err != nil {
		return "", -1, err
	}
	ret := r.runAtomic(jobId, signal)
	if err := exec.SetStatus(r.RepoTarget, ret.status, ret.detail, ret.missing, ret.duration); err != nil {
		return "", -1, err
	}
	if ret.status == "error" {
		return "", -1, errors.New(ret.detail)
	}
	return fmt.Sprintf(success, ret.detail, ret.duration), ret.missing, nil
}

// runJob runs a job with a given id and returns the status, detail, missing and duration
func (r *Run) runAtomic(jobId int64, signal chan os.Signal) *runReturn {
	now := time.Now()
	ctx, close := context.WithTimeout(context.Background(), runTimeout)
	defer close()
	ret := make(chan *runReturn)
	tx := r.RepoTarget.Begin("")
	defer r.RepoTarget.Rollback(tx)
	go r.runMain(jobId, ret, tx)
	select {
	case <-ctx.Done():
		return &runReturn{status: errorStatus, detail: ctx.Err().Error(), missing: -1, duration: time.Since(now).Seconds()}
	case r := <-ret:
		r.duration = time.Since(now).Seconds()
		return r
	case <-signal:
		return &runReturn{status: errorStatus, detail: "interrupted", missing: -1, duration: time.Since(now).Seconds()}
	}
}

// run runs the use case
func (r *Run) runMain(jobId int64, ret chan *runReturn, tx interface{}) {
	job := &domain.Job{Id: jobId}
	if err := job.LoadLock(r.RepoTarget, tx); err != nil {
		ret <- &runReturn{status: errorStatus, detail: err.Error(), missing: -1, duration: -1}
		return
	}
	refs, err := r.getReferences(jobId, tx)
	if err != nil {
		ret <- &runReturn{status: errorStatus, detail: err.Error(), missing: -1, duration: -1}
		return
	}
	action, err := r.factory(job.Action)
	if err != nil {
		ret <- &runReturn{status: errorStatus, detail: err.Error(), missing: -1, duration: -1}
		return
	}
	message, missing, err := action.Run(job, refs, tx)
	if err != nil {
		ret <- &runReturn{status: errorStatus, detail: err.Error(), missing: -1, duration: -1}
		return
	}
	if err := r.RepoTarget.Commit(tx); err != nil {
		ret <- &runReturn{status: errorStatus, detail: err.Error(), missing: -1, duration: -1}
		return
	}
	ret <- &runReturn{status: successStatus, detail: message, missing: missing, duration: -1}
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
