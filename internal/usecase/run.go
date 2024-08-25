package usecase

import (
	"context"
	"errors"
	"os"
	"sync"
	"time"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

// Run is a struct that represents the use case
type Run struct {
	Base
}

// NewRun creates a new use case
func NewRun(repoSource port.Repository, repoTarget port.Repository, signal chan os.Signal) *Run {
	return &Run{
		Base: Base{
			RepoSource: repoSource,
			RepoTarget: repoTarget,
			Signal:     signal,
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
			r.sendOut(out, "", -1, -1, port.InterrupedStatus, "interrupted", start)
			break
		}
	}
}

// runCycle runs a cycle of jobs
func (r *Run) runCycle(in *port.RunIn, out chan *port.RunOut, start time.Time) bool {
	jobs, err := r.getJobsId(in.JobID, r.RepoTarget)
	if err != nil {
		r.sendOut(out, "", -1, -1, port.ErrorStatus, err.Error(), start)
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
		ret := r.runJobCycle(job.Id, out, start, shift)
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
func (r *Run) runJobCycle(jobId string, out chan *port.RunOut, start time.Time, shift int64) *port.RunOut {
	exec := &domain.Log{}
	if err := exec.Init(r.RepoTarget, jobId, start, shift); err != nil {
		return r.sendOut(out, jobId, shift, -1, port.ErrorStatus, err.Error(), start)
	}
	tx := r.RepoTarget.Begin("")
	defer r.RepoTarget.Rollback(tx)
	var close context.CancelFunc
	r.Ctx, close = context.WithTimeout(context.Background(), port.RunTimeout)
	defer close()
	ret := r.runWait(jobId, out, start, shift, tx)
	if err := exec.SetStatus(r.RepoTarget, ret); err != nil {
		return r.sendOut(out, jobId, shift, -1, port.ErrorStatus, err.Error(), start)
	}
	return ret
}

// runWait waits for a given time
func (r *Run) runWait(jobId string, out chan *port.RunOut, start time.Time, shift int64, tx interface{}) *port.RunOut {
	run := make(chan *port.RunOut)
	wg := sync.WaitGroup{}
	wg.Add(2)
	go func() {
		time.Sleep(port.DbRelief)
		wg.Done()
	}()
	go r.runAtom(jobId, run, tx, start, shift, &wg)
	select {
	case <-r.Ctx.Done():
		return r.sendOut(out, jobId, shift, -1, port.ErrorStatus, "timeout", start)
	case <-r.Signal:
		return r.sendOut(out, jobId, shift, -1, port.InterrupedStatus, "interrupted", start)
	case r := <-run:
		wg.Wait()
		r.Duration = time.Since(start).Seconds()
		out <- r
		return r
	}
}

// run runs the use case
func (r *Run) runAtom(jobId string, out chan *port.RunOut, tx interface{},
	start time.Time, shift int64, wg *sync.WaitGroup) *port.RunOut {
	defer wg.Done()
	job := &domain.Job{Id: jobId}
	if err := job.Load(r.RepoTarget, tx, true); err != nil {
		return r.sendOut(out, jobId, shift, -1, port.ErrorStatus, err.Error(), start)
	}
	action, err := r.factory(job.Action)
	if err != nil {
		return r.sendOut(out, jobId, shift, -1, port.ErrorStatus, err.Error(), start)
	}
	if action == nil {
		return r.sendOut(out, job.Id, 0, 0, port.SuccessStatus, "none action", time.Now())
	}
	message, more, err := action.Run(job, tx)
	if err != nil {
		return r.sendOut(out, jobId, shift, more, port.ErrorStatus, err.Error(), start)
	}
	if err := r.RepoTarget.Commit(tx); err != nil {
		return r.sendOut(out, jobId, shift, more, port.ErrorStatus, err.Error(), start)
	}
	return r.sendOut(out, jobId, shift, more, port.SuccessStatus, message, start)
}

// sendMessage sends a message to the channel
func (r *Run) sendOut(out chan *port.RunOut, id string, shift, more int64, status, detail string, start time.Time) *port.RunOut {
	dur := time.Since(start).Seconds()
	ret := &port.RunOut{JobID: id, Shift: shift, Status: status, Detail: detail, Duration: dur, More: more}
	out <- ret
	return ret
}

// sleep sleeps for a given time or until a signal is received
func (r *Run) sleep(in *port.RunIn) bool {
	select {
	case <-r.Signal:
		return true
	case <-time.After(time.Duration(in.Delay) * time.Second):
		return false
	}
}

// finish sends a finish message to the channel
func (r *Run) finish(repo port.Repository, out chan *port.RunOut, start time.Time) {
	ret := port.RunOut{
		JobID:    "",
		Shift:    -1,
		Status:   port.FinishedStatus,
		Detail:   "finished signal",
		Start:    start,
		Duration: time.Since(start).Seconds(),
		More:     -1,
	}
	log := &domain.Log{}
	if err := log.Init(repo, "", start, -1); err != nil {
		r.sendOut(out, "", -1, -1, port.ErrorStatus, err.Error(), start)
		r.sendOut(out, "", -1, -1, port.FinishedStatus, "", start)
		return
	}
	if err := log.SetStatus(repo, &ret); err != nil {
		r.sendOut(out, "", -1, -1, port.ErrorStatus, err.Error(), start)
		r.sendOut(out, "", -1, -1, port.FinishedStatus, "", start)
		return
	}
	out <- &ret
}

// getOut returns true if the RunOut has an error or is interrupted
func (r *Run) getOut(ret *port.RunOut, skipError bool) bool {
	return (ret.Status == port.ErrorStatus && skipError) || ret.Status == port.InterrupedStatus
}

// getJobsId
func (r *Run) getJobsId(jobId string, repo port.Repository) (*[]domain.Job, error) {
	job := domain.Job{}
	if jobId != "" {
		job.Id = jobId
		if err := job.Load(repo, nil, false); err != nil {
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

// factoryAction creates a new action use case
func (r *Run) factory(action string) (port.RunAction, error) {
	base := Base{RepoSource: r.RepoSource, RepoTarget: r.RepoTarget, Ctx: r.Ctx, Signal: r.Signal}
	switch action {
	case "copy":
		return &Copy{Base: base}, nil
	case "update":
		return &Update{Base: base}, nil
	case "none":
		return nil, nil
	}
	return nil, errors.New(port.ErrActionNotFound)
}
