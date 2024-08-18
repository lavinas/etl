package port

import (
	"os"
)

const (
	ErrorStatus      = "error"
	SuccessStatus    = "success"
	InterrupedStatus = "stopped"
	FinishedStatus   = "<end>"
)

// RunIn is a struct that represents the input of the Run
type RunIn struct {
	Repeat     int64
	Shifts     int64
	ErrorSkip  bool
	Delay      int64
	JobID      int64
	Signal     chan os.Signal
}

// RunOut is a struct that represents the output of the Run
type RunOut struct {
	Status   string
	Detail   string
	Missing  int64
	Duration float64
}

// UseCase is a interface that represents the use case to run
type UseCase interface {
	Run(*RunIn, chan *RunOut)
}

// RunAction is a interface that represents the action to run a specific job use case
// It returns a message, a count of missing itens to process and an error
type RunAction interface {
	Run(Domain, interface{}, interface{}) (string, int64, error)
}
