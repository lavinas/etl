package usecase

import (
	"context"
	"errors"
	"time"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	success          = "%s in %.4f seconds"
	errorStatus      = "error"
	successStatus    = "success"
	interrupedStatus = "interrupted"
	channelFinished  = "finished"
	runTimeout       = 5 * time.Second
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
func (r *Run) Run(in *port.RunIn, out chan *port.RunOut) {
	if in == nil || out == nil {
		panic("Run: Invalid input parameters")
	}
	defer r.finishRun(out, time.Now())
	count := int64(0)
	for {
		if r.runCycle(in, out) {
			break
		}
		count++
		if (in.Repeat != 0 && count >= in.Repeat) {
			break
		}
		time.Sleep(time.Duration(in.Delay) * time.Second)
	}
}

// runCycle runs a cycle of jobs
func (r *Run) runCycle(in *port.RunIn, out chan *port.RunOut) bool {
	jobs, err := r.getJobsId(in.JobID, r.RepoTarget)
	if err != nil {
		ret := &port.RunOut{Status: port.ErrorStatus, Detail: err.Error(), Missing: -1, Duration: -1}
		r.sendOut(out, ret)
		return true
	}
	for _, j := range *jobs {
		if r.runJob(&j, in, out) {
			break
		}
	}
	return false
}

// runUntil runs all jobs until finish all registers
func (r *Run) runJob(job *domain.Job, in *port.RunIn, out chan *port.RunOut) bool {
	count := int64(1)
	for {
		if r.runJobCycle(job.Id, in, out) {
			return true
		}
		if in.Shifts != 0 && count >= in.Shifts {
			return false
		}
		count++
	}
}

// runJobCycle runs a cycle of job
func (r *Run) runJobCycle(jobId int64, in *port.RunIn, out chan *port.RunOut) bool {
	exec := &domain.Exec{}
	if err := exec.Init(r.RepoTarget, jobId); err != nil {
		ret := &port.RunOut{Status: port.ErrorStatus, Detail: err.Error(), Missing: -1, Duration: -1}
		r.sendOut(out, ret)
		return true
	}
	ret := r.runAtomic(jobId, in, out)
	if err := exec.SetStatus(r.RepoTarget, ret.Status, ret.Detail, ret.Missing, ret.Duration); err != nil {
		ret := &port.RunOut{Status: port.ErrorStatus, Detail: err.Error(), Missing: -1, Duration: -1}
		r.sendOut(out, ret)
		return true
	}
	if ret.Status == port.InterrupedStatus || ret.Status == port.ErrorStatus {
		return true
	}
	return false
}

// runJob runs a job with a given id and returns the status, detail, missing and duration
func (r *Run) runAtomic(jobId int64, in *port.RunIn, out chan *port.RunOut) *port.RunOut {
	now := time.Now()
	ctx, close := context.WithTimeout(context.Background(), runTimeout)
	defer close()
	ret := make(chan *port.RunOut)
	tx := r.RepoTarget.Begin("")
	defer r.RepoTarget.Rollback(tx)
	go r.runAtom(jobId, ret, tx)
	select {
	case <-ctx.Done():
		ret := &port.RunOut{Status: port.ErrorStatus, Detail: "timeout", Missing: -1, Duration: time.Since(now).Seconds()}
		out <- ret
		return ret
	case <- in.Signal:
		ret := &port.RunOut{Status: port.InterrupedStatus, Detail: "stopped", Missing: -1, Duration: time.Since(now).Seconds()}
		out <- ret
		return ret
	case r := <-ret:
		r.Duration = time.Since(now).Seconds()
		out <- r
		return r
	}
}

// run runs the use case
func (r *Run) runAtom(jobId int64, out chan *port.RunOut, tx interface{}) {
	job := &domain.Job{Id: jobId}
	if err := job.LoadLock(r.RepoTarget, tx); err != nil {
		ret := &port.RunOut{Status: errorStatus, Detail: err.Error(), Missing: -1, Duration: -1}
		out <- ret
		return
	}
	refs, err := r.getReferences(jobId, tx)
	if err != nil {
		ret := &port.RunOut{Status: errorStatus, Detail: err.Error(), Missing: -1, Duration: -1}
		out <- ret
		return
	}
	action, err := r.factory(job.Action)
	if err != nil {
		ret := &port.RunOut{Status: errorStatus, Detail: err.Error(), Missing: -1, Duration: -1}
		out <- ret
		return
	}
	message, missing, err := action.Run(job, refs, tx)
	if err != nil {
		ret := &port.RunOut{Status: errorStatus, Detail: err.Error(), Missing: -1, Duration: -1}
		out <- ret
		return
	}
	if err := r.RepoTarget.Commit(tx); err != nil {
		ret := &port.RunOut{Status: errorStatus, Detail: err.Error(), Missing: -1, Duration: -1}
		out <- ret
		return
	}
	ret := &port.RunOut{Status: successStatus, Detail: message, Missing: missing, Duration: -1}
	out <- ret
}


// finishRun finishes the run
func (r *Run) finishRun(out chan *port.RunOut, start time.Time) {
	end := &port.RunOut{Status: port.FinishedStatus, Detail: "", Missing: -1, Duration: time.Since(start).Seconds()}
	r.sendOut(out, end)
}

// sendMessage sends a message to the channel
func (r *Run) sendOut(outChan chan *port.RunOut, out *port.RunOut) {
	if outChan != nil {
		outChan <- out
	}
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
