package usecase

import (
	"fmt"
	"os"

	"github.com/lavinas/vooo-etl/internal/domain"
	"github.com/lavinas/vooo-etl/internal/port"
)

// Delete is a struct that represents the delete use case
type Truncate struct {
	Base
}

// NewMount creates a new mount usecase
func NewTruncate(repoSource port.Repository, repoTarget port.Repository, signal chan os.Signal) *Truncate {
	return &Truncate{
		Base: Base{
			RepoSource: nil,
			RepoTarget: repoTarget,
			Signal:     signal,
		},
	}
}

// Run executes the delete use case
func (c *Truncate) Run(in *port.TruncateIn, out chan *port.TruncateOut) {
	defer func() {
		out <- &port.TruncateOut{Status: port.FinishedStatus}
	}()
	jobs, err := c.getJobsId(in.JobID, c.RepoTarget)
	if err != nil {
		out <- &port.TruncateOut{Status: port.ErrorStatus, Detail: err.Error()}
		return
	}
	ok := make(chan bool)
	go c.truncateAtomic(jobs, out, ok)
	select {
	case <-ok:
		break
	case <-c.Signal:
		out <- &port.TruncateOut{Status: port.InterrupedStatus, Detail: "interrupted"}
	}
}

// truncateAtomic truncates a table represented by a job
func (t *Truncate) truncateAtomic(jobs *[]domain.Job, out chan *port.TruncateOut, ok chan bool) {
	defer func() {
		ok <- true
	}()
	count := 1
	total := len(*jobs)
	tx := t.RepoTarget.Begin("")
	defer t.RepoTarget.Rollback(tx)
	for _, j := range *jobs {
		t.executeJob(&j, out, int64(count), int64(total), tx)
		count++
	}
	if err := t.RepoTarget.Commit(tx); err != nil {
		out <- &port.TruncateOut{Status: port.ErrorStatus, Detail: err.Error()}
		return
	}
}

// getJobsId
func (t *Truncate) getJobsId(jobId int64, repo port.Repository) (*[]domain.Job, error) {
	tx := t.RepoTarget.Begin("")
	defer t.RepoTarget.Rollback(tx)
	job := domain.Job{}
	if jobId != -1 {
		job.Id = jobId
		if err := job.Load(repo, tx, false); err != nil {
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

// executeJob executes a job
func (t *Truncate) executeJob(j *domain.Job, out chan *port.TruncateOut, count int64, total int64, tx interface{}) {
	msg, _, err := t.truncateJob(j, tx)
	if err != nil {
		out <- &port.TruncateOut{Status: port.ErrorStatus, Detail: err.Error()}
		return
	}
	msg = fmt.Sprintf("%s - %d/%d", msg, count, total)
	out <- &port.TruncateOut{JobID: j.Id, Status: port.SuccessStatus, Detail: msg}
}


// truncateJob truncates a table represented by a job
func (c *Truncate) truncateJob(j *domain.Job, txTarget interface{}) (string, int64, error) {
	_, err := c.RepoTarget.Exec(txTarget, port.TruncateDisableFK)
	if err != nil {
		return "", -1, err
	}
	defer c.RepoTarget.Exec(txTarget, port.TruncateEnableFK)
	q := fmt.Sprintf(port.TruncateTruncate, j.Base, j.Object)
	_, err = c.RepoTarget.Exec(txTarget, q)
	if err != nil {
		return "", -1, err
	}
	return fmt.Sprintf(port.TruncateReturnMessage, j.Base, j.Object), -1, nil
}
