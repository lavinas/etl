package handler

import (
	"log"
	"strconv"

	"github.com/alexflint/go-arg"
	"github.com/lavinas/vooo-etl/internal/port"
)

// args is a struct that represents the command line arguments
type Args struct {
	Action    string `arg:"-a,--action" default:"run" help:"Action to run. Default is run"`
	Repeat    int64  `arg:"-r,--repeat" default:"1" help:"Repeat jobs n times. Default is 1. <=0 is ilimited"`
	Shifts    int64  `arg:"-s,--shifts" default:"1" help:"Shifts to run. Default is 1. <= 0 is all shifts"`
	ErrorSkip bool   `arg:"-e,--error" default:"false" help:"Skip errors beetwen jobs. Default is false"`
	Delay     int64  `arg:"-d,--delay" default:"30" help:"Delay between runs in seconds. Default is 30 seconds"`
	JobID     string `arg:"-i,--id" default:"-1" help:"id of the job to run. Default is all jobs"`
	Schema    string `arg:"-c,--schema" default:"" help:"Schema to run. Default is all schemas configured"`
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
	ret["action"] = a.Action
	ret["jobID"] = a.JobID
	ret["schema"] = a.Schema
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
	return ret
}

// Run runs the command line handler
func (c *CommandLine) Run() {
	args := Args{}
	arg.MustParse(&args)
	switch args.Action {
	case "run":
		c.actionRun(args)
	case "setup":
		c.actionSetup(args)
	case "check":
		c.actionSetup(args)
	case "truncate":
		c.actionTruncate(args)
	default:
		log.Println(port.ErrActionNotFound)
	}
}

// run runs the use case
func (c *CommandLine) actionRun(args Args) {
	outs := make(chan *port.RunOut)
	defer close(outs)
	jobId, err := strconv.ParseInt(args.JobID, 10, 64)
	if err != nil || jobId < -1 {
		jobId = -1
	}
	in := port.RunIn{Repeat: args.Repeat, Shifts: args.Shifts, ErrorSkip: args.ErrorSkip,
		Delay: args.Delay, JobID: jobId}
	go c.usecase.Run(&in, outs)
	for out := range outs {
		if out.Status == port.FinishedStatus {
			break
		}
		log.Println(out.String())
	}
}

// actionSetup runs the setup use case
func (c *CommandLine) actionSetup(args Args) {
	outs := make(chan *port.SetUpOut)
	defer close(outs)
	in := port.SetUpIn{Action: args.Action, Schema: args.Schema}
	go c.usecase.SetUp(&in, outs)
	for out := range outs {
		if out.Status == port.FinishedStatus {
			break
		}
		log.Println(out.String())
	}
}

// actionTruncate runs the truncate use case
func (c *CommandLine) actionTruncate(args Args) {
	outs := make(chan *port.TruncateOut)
	defer close(outs)
	jobId, err := strconv.ParseInt(args.JobID, 10, 64)
	if err != nil || jobId < -1 {
		jobId = -1
	}
	in := port.TruncateIn{JobID: jobId}
	go c.usecase.Truncate(&in, outs)
	for out := range outs {
		if out.Status == port.FinishedStatus {
			break
		}
		log.Println(out.String())
	}
}
