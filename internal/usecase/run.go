package usecase

import (
	"context"
	"errors"
	"time"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

const (
	runTimeout = 30 * time.Second
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
	start := time.Now()
	defer r.finish(r.RepoTarget, out, start)
	count := int64(0)
	for {
		if r.runCycle(in, out, start) {
			break
		}
		count++
		if in.Repeat != 0 && count >= in.Repeat {
			break
		}
		if r.sleep(in) {
			r.sendOut(out, -1, -1, -1, port.InterrupedStatus, "interrupted", start)
			break
		}
	}
}

// runCycle runs a cycle of jobs
func (r *Run) runCycle(in *port.RunIn, out chan *port.RunOut, start time.Time) bool {
	jobs, err := r.getJobsId(in.JobID, r.RepoTarget)
	if err != nil {
		r.sendOut(out, -1, -1, -1, port.ErrorStatus, err.Error(), start)
		return true
	}
	for _, j := range *jobs {
		ret := r.runJob(&j, in, out, start)
		if r.getOut(ret, in.ErrorSkip) {
			return true
		}
	}
	return false
}

// runUntil runs all jobs until finish all registers
func (r *Run) runJob(job *domain.Job, in *port.RunIn, out chan *port.RunOut, start time.Time) *port.RunOut {
	shift := int64(1)
	for {
		ret := r.runJobCycle(job.Id, in, out, start, shift)
		if r.getOut(ret, in.ErrorSkip) {
			return ret
		}
		if ret.More == 0 {
			return ret
		}
		if in.Shifts != 0 && shift >= in.Shifts {
			return ret
		}
		shift++
	}
}

// runJobCycle runs a cycle of job
func (r *Run) runJobCycle(jobId int64, in *port.RunIn, out chan *port.RunOut, start time.Time, shift int64) *port.RunOut {
	exec := &domain.Exec{}
	if err := exec.Init(r.RepoTarget, jobId, start, shift); err != nil {
		return r.sendOut(out, jobId, shift, -1, port.ErrorStatus, err.Error(), start)
	}
	ret := r.runAtomic(jobId, in, out, start, shift)
	if err := exec.SetStatus(r.RepoTarget, ret); err != nil {
		return r.sendOut(out, jobId, shift, -1, port.ErrorStatus, err.Error(), start)
	}
	return ret
}

// runJob runs a job with a given id and returns output struct
func (r *Run) runAtomic(jobId int64, in *port.RunIn, out chan *port.RunOut, start time.Time, shift int64) *port.RunOut {
	now := time.Now()
	ctx, close := context.WithTimeout(context.Background(), runTimeout)
	defer close()
	ret := make(chan *port.RunOut)
	tx := r.RepoTarget.Begin("")
	defer r.RepoTarget.Rollback(tx)
	go r.runAtom(jobId, ret, tx, start, shift)
	select {
	case <-ctx.Done():
		return r.sendOut(out, jobId, shift, -1, port.ErrorStatus, "timeout", start)
	case <-in.Signal:
		return r.sendOut(out, jobId, shift, -1, port.InterrupedStatus, "interrupted", start)
	case r := <-ret:
		r.Duration = time.Since(now).Seconds()
		out <- r
		return r
	}
}

// run runs the use case
func (r *Run) runAtom(jobId int64, out chan *port.RunOut, tx interface{}, start time.Time, shift int64) *port.RunOut {
	job := &domain.Job{Id: jobId}
	if err := job.LoadLock(r.RepoTarget, tx); err != nil {
		return r.sendOut(out, jobId, shift, -1, port.ErrorStatus, err.Error(), start)
	}
	refs, err := r.getReferences(jobId, tx)
	if err != nil {
		return r.sendOut(out, jobId, shift, -1, port.ErrorStatus, err.Error(), start)
	}
	action, err := r.factory(job.Action)
	if err != nil {
		return r.sendOut(out, jobId, shift, -1, port.ErrorStatus, err.Error(), start)
	}
	message, more, err := action.Run(job, refs, tx)
	if err != nil {
		return r.sendOut(out, jobId, shift, more, port.ErrorStatus, err.Error(), start)
	}
	if err := r.RepoTarget.Commit(tx); err != nil {
		return r.sendOut(out, jobId, shift, more, port.ErrorStatus, err.Error(), start)
	}

	return r.sendOut(out, jobId, shift, more, port.SuccessStatus, message, start)
}

// sendMessage sends a message to the channel
func (r *Run) sendOut(out chan *port.RunOut, id, shift, more int64, status, detail string, start time.Time) *port.RunOut {
	dur := time.Since(start).Seconds()
	ret := &port.RunOut{JobID: id, Shift: shift, Status: status, Detail: detail, Duration: dur, More: more}
	out <- ret
	return ret
}

// sleep sleeps for a given time or until a signal is received
func (r *Run) sleep(in *port.RunIn) bool {
	select {
	case <-in.Signal:
		return true
	case <-time.After(time.Duration(in.Delay) * time.Second):
		return false
	}
}

// finish sends a finish message to the channel
func (r *Run) finish(repo port.Repository, out chan *port.RunOut, start time.Time) {
	ret := port.RunOut{
		JobID:    -1,
		Shift:    -1,
		Status:   port.FinishedStatus,
		Detail:   "finished signal",
		Start:    start,
		Duration: time.Since(start).Seconds(),
		More:     -1,
	}
	exec := &domain.Exec{}
	if err := exec.Init(repo, -1, start, -1); err != nil {
		r.sendOut(out, -1, -1, -1, port.ErrorStatus, err.Error(), start)
		r.sendOut(out, -1, -1, -1, port.FinishedStatus, "", start)
		return
	}
	if err := exec.SetStatus(repo, &ret); err != nil {
		r.sendOut(out, -1, -1, -1, port.ErrorStatus, err.Error(), start)
		r.sendOut(out, -1, -1, -1, port.FinishedStatus, "", start)
		return
	}
	out <- &ret
}

// getOut returns true if the RunOut has an error or is interrupted
func (r *Run) getOut(ret *port.RunOut, skipError bool) bool {
	return (ret.Status == port.ErrorStatus && skipError) || ret.Status == port.InterrupedStatus
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
		ret[i] = References{Id: j.Id, Name: j.Name, Base: j.Base, Object: j.Object, Field: j.Field, 
			Last: j.Last, Limit: j.Limit, FieldReferrer: re.FieldReferrer, FieldReferred: re.FieldReferred}
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
	case "update":
		return NewUpdate(r.RepoSource, r.RepoTarget), nil
	}
	return nil, errors.New(port.ErrActionNotFound)
}
