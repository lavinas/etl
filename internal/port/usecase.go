package port

import (
	"fmt"
	"os"
	"time"
)

const (
	ErrorStatus      = "error"
	SuccessStatus    = "success"
	InterrupedStatus = "interrupted"
	FinishedStatus   = "finished"
	stringOutput     = "Run: %d - %d: %s - %s in %.4f seconds"
)

// RunIn is a struct that represents the input of the Run
type RunIn struct {
	Repeat    int64
	Shifts    int64
	ErrorSkip bool
	Delay     int64
	JobID     int64
	Signal    chan os.Signal
}

// RunOut is a struct that represents the output of the Run
type RunOut struct {
	JobID    int64
	Shift    int64
	Status   string
	Detail   string
	Start    time.Time
	Duration float64
	More     int64
}

// String returns a string representation of the RunOut
func (r *RunOut) String() string {
	ret := fmt.Sprintf(stringOutput, r.JobID, r.Shift, r.Status, r.Detail, r.Duration)
	if r.More != -1 {
		ret += fmt.Sprintf(". More: %d", r.More)
	}
	return ret
}

// UseCase is a interface that represents the use case to run
type UseCase interface {
	Run(*RunIn, chan *RunOut)
}

// RunAction is a interface that represents the action to run a specific job use case
// It returns a message, if there are more to run or an error
type RunAction interface {
	Run(Domain, interface{}, interface{}) (string, int64, error)
}
