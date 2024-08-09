package handler

import (
	"fmt"

	"github.com/lavinas/vooo-etl/internal/port"

	"github.com/alexflint/go-arg"
)

// args is a struct that represents the command line arguments
var args struct {
	JobID int64 `arg:"-i,--id,required" help:"Job ID to run"`
}

// CommandLine is a struct that represents the command line handler
type CommandLine struct {
	usecase port.UseCase
}

// NewLine creates a new handler
func NewLine(useCase port.UseCase) *CommandLine {
	return &CommandLine{usecase: useCase}
}

// Run runs the command line handler
func (c *CommandLine) Run() {
	p := arg.MustParse(&args)
	if qtt, err := c.usecase.RunJob(args.JobID); err != nil {
		p.Fail(err.Error())
	} else {
		fmt.Printf("ok: %s\nexit status 0", qtt)
	}
}
