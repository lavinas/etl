package port

import (
	"os"
)

// RunParams is a struct that represents the parameters to use case run
type RunParams struct {
	Repeat     int64
	Shifts     int64
	ErrorSkip  bool
	Delay      int64
	JobID      int64
	Signal     chan os.Signal
	RetMessage chan string
}

// UseCase is a interface that represents the use case to run
type UseCase interface {
	Run(params *RunParams) error
}

// RunAction is a interface that represents the action to run a specific job use case
// It returns a message, a count of missing itens to process and an error
type RunAction interface {
	Run(Domain, interface{}, interface{}) (string, int64, error)
}
