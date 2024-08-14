package handler

import (
	"fmt"

	"github.com/alexflint/go-arg"
	"github.com/lavinas/vooo-etl/internal/port"
)

// args is a struct that represents the command line arguments
type Args struct {
	JobID int64 `arg:"-i,--id" default:"-1" help:"Job ID to run"`
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