package handler

import (
	"fmt"

	"github.com/alexflint/go-arg"
	"github.com/lavinas/vooo-etl/internal/port"
)

// args is a struct that represents the command line arguments
type Args struct {
	JobID  int64 `arg:"-i,--id" default:"-1" help:"id of the job to run. Default is all jobs"`
	Shifts int64 `arg:"-s,--shifts" default:"-1" help:"Shifts to run. Default is ilimited. Values less than 1, 1 is assumed"`
}

// CommandLine is a struct that represents the command line handler
type CommandLine struct {
	usecase port.UseCase
}

// NewLine creates a new handler
func NewLine(useCase port.UseCase) *CommandLine {
	return &CommandLine{usecase: useCase}
}

// GetParams returns the command line arguments
func (a *Args) GetParams() map[string]interface{} {
	var ret = make(map[string]interface{})
	if a.JobID != -1 {
		ret["JobID"] = a.JobID
	}
	if a.Shifts != -1 {
		ret["Shifts"] = a.Shifts
	}
	return ret
}

// Run runs the command line handler
func (c *CommandLine) Run() {
	args := Args{}
	arg.MustParse(&args)
	messageChan := make(chan string)
	defer close(messageChan)
	go c.usecase.Run(&args, messageChan)
	for message := range messageChan {
		switch message {
		case "<end>":
			return
		default:
			fmt.Println(message)
		}
	}
}
