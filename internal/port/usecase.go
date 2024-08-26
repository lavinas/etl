package port

const (
	ErrorStatus      = "error"
	SuccessStatus    = "success"
	InterrupedStatus = "interrupted"
	FinishedStatus   = "finished"
	stringOutput     = "Run: %d - %d: %s - %s in %.4f seconds"
)


// UseCase is a interface that represents the use case to run
type UseCase interface {
	SetUp(*SetUpIn, chan *SetUpOut)
	Run(*RunIn, chan *RunOut)
}

// RunAction is a interface that represents the action to run a specific job use case
// It returns a message, if there are more to run or an error
type RunAction interface {
	Run(job Domain, tx interface{}) (string, int64, error)
}
