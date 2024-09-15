package handler

import (
	"log"
	"math"
	"os"
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
	JobID     string `arg:"-i,--id" default:"-1" help:"id of the job to run. If until is determined, it is start of the range. Default is all jobs"`
	JobUntil  string `arg:"-u,--until" default:"-1" help:"until job id to run. Id it is not determined, just 1 job is accept"`
	Schema    string `arg:"-c,--schema" default:"" help:"Schema to run. Default is all schemas configured"`
	Log       string `arg:"-l,--log" default:"" help:"Log file to write. Default is stdout"`
	Back      int64  `arg:"-b,--back" default:"0" help:"How mamu cycles to run back. Default is 0. If 0, it is not run back"`
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
	args := Args{}
	arg.MustParse(&args)
	f := c.fileLog(args)
	defer f.Close()
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
		log.Printf(port.ErrActionNotFound+"/n", args.Action)
	}
}

// fileLog writes the log to a file if the log file is set
func (c *CommandLine) fileLog(args Args) *os.File {
	if args.Log != "" {
		f, err := os.OpenFile(args.Log, os.O_RDWR|os.O_CREATE|os.O_APPEND, 0666)
		if err != nil {
			log.Println(err)
		}
		log.SetOutput(f)
		return f
	}
	return nil
}

// run runs the use case
func (c *CommandLine) actionRun(args Args) {
	outs := make(chan *port.RunOut)
	defer close(outs)
	jobId, err := strconv.ParseInt(args.JobID, 10, 64)
	if err != nil || jobId < -1 {
		jobId = -1
	}
	until, err := strconv.ParseInt(args.JobUntil, 10, 64)
	if err != nil {
		until = -1
	}
	if until == -1 {
		if jobId != -1 {
			until = jobId
		} else {
			until = math.MaxInt64
		}
	}
	in := port.RunIn{Repeat: args.Repeat, Shifts: args.Shifts, ErrorSkip: args.ErrorSkip,
		Delay: args.Delay, JobID: jobId, Until: until, Back: args.Back}
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
