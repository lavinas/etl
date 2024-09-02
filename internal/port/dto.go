package port

import (
	"fmt"
	"time"
)

// RunIn is a struct that represents the input of the Run
type RunIn struct {
	Repeat    int64
	Shifts    int64
	ErrorSkip bool
	Delay     int64
	JobID     int64
	Until     int64
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

// SetUpIn is a struct that represents the input of the SetUp
type SetUpIn struct {
	Action string
	Schema string
}

// SetUpOut is a struct that represents the output of the SetUp
type SetUpOut struct {
	Status string
	Detail string
}

// TruncateIn is a struct that represents the input of the Truncate
type TruncateIn struct {
	JobID int64
}

// TruncateOut is a struct that represents the output of the Truncate
type TruncateOut struct {
	JobID  int64
	Status string
	Detail string
}

// String returns a string representation of the RunOut
func (r *RunOut) String() string {
	ret := fmt.Sprintf(stringOutput, r.JobID, r.Shift, r.Status, r.Detail, r.Duration)
	if r.More != -1 {
		ret += fmt.Sprintf(". More: %d", r.More)
	}
	return ret
}

// string returns a string representation of the SetUpOut
func (s *SetUpOut) String() string {
	return fmt.Sprintf("%s: %s", s.Status, s.Detail)
}

// string returns a string representation of the TruncateOut
func (t *TruncateOut) String() string {
	return fmt.Sprintf("%s: %s", t.Status, t.Detail)
}
