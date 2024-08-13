package port

const (
	ErrRepoNilTx               = "tx informed is nil"
	ErrRepoInvalidTX           = "tx informed is invalid"
	ErrRepoNilObject           = "object informed is nil"
	ErrRepoInvalidObject       = "object informed is invalid"
	ErrRepoSshInvalid          = "ssh dns is invalid"
	ErrJobNotFound             = "job not found"
	ErrJobNotReady             = "job is not ready"
	ErrJobNotRunning           = "job is not running"
	ErrRepoPassNotImplemented  = "just file implemented"
	ErrRepoProtoNotImplemented = "just tcp implemented"
	ErrActionNotFound          = "action not found"
	ErrJobTypeNotImplemented   = "job type not implemented"
	ErrFieldNotFound           = "field not found"
	ErrReferenceNotFound       = "reference not found"
	ErrReferenceNotDone        = "reference '%s' not done"
	ErrAggregatorNotFound      = "aggregator not found"
	ErrJobsNotFound            = "no jobs is found"
)
