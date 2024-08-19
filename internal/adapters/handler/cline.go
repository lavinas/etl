package handler

import (
	"log"
	"os"
	"os/signal"

	"github.com/alexflint/go-arg"
	"github.com/lavinas/vooo-etl/internal/port"
)

// args is a struct that represents the command line arguments
type Args struct {
	Repeat    int64 `arg:"-r,--repeat" default:"1" help:"Repeat jobs n times. Default is 1. <=0 is ilimited"`
	Shifts    int64 `arg:"-s,--shifts" default:"1" help:"Shifts to run. Default is 1. <= 0 is all shifts"`
	ErrorSkip bool  `arg:"-e,--error" default:"false" help:"Skip errors beetwen jobs. Default is false"`
	Delay     int64 `arg:"-d,--delay" default:"30" help:"Delay between runs in seconds. Default is 30 seconds"`
	JobID     int64 `arg:"-i,--id" default:"-1" help:"id of the job to run. Default is all jobs"`
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
	if ret["repeat"] = a.Repeat; a.Repeat <= 0 {
		ret["repeat"] = 0
	}
	if ret["shifts"] = a.Shifts; a.Shifts <= 0 {
		ret["shifts"] = 0
	}
	ret["errorSkip"] = a.ErrorSkip
	if ret["delay"] = a.Delay; a.Delay <= 0 {
		ret["delay"] = 30
	}
	if ret["jobID"] = a.JobID; a.JobID <= -1 {
		ret["jobID"] = -1
	}
	return ret
}

// Run runs the command line handler
func (c *CommandLine) Run() {
	args := Args{}
	arg.MustParse(&args)
	outs := make(chan *port.RunOut)
	defer close(outs)
	sig := make(chan os.Signal, 1)
	defer close(sig)
	signal.Notify(sig, os.Interrupt)
	in := port.RunIn{Repeat: args.Repeat, Shifts: args.Shifts, ErrorSkip: args.ErrorSkip,
		Delay: args.Delay, JobID: args.JobID, Signal: sig}
	go c.usecase.Run(&in, outs)
	for out := range outs {
		if out.Status == port.FinishedStatus {
			break
		}
		log.Println(out.String())
	}
}
