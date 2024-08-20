package port

const (
	ErrRepoNilTx                = "tx informed is nil"
	ErrRepoInvalidTX            = "tx informed is invalid"
	ErrRepoNilObject            = "object informed is nil"
	ErrRepoInvalidObject        = "object informed is invalid"
	ErrRepoSshInvalid           = "ssh dns is invalid"
	ErrJobNotFound              = "job not found"
	ErrJobNotReady              = "job is not ready"
	ErrJobNotRunning            = "job is not running"
	ErrRepoPassNotImplemented   = "just file implemented"
	ErrRepoProtoNotImplemented  = "just tcp implemented"
	ErrActionNotFound           = "action not found"
	ErrJobTypeNotImplemented    = "job type not implemented"
	ErrFieldNotFound            = "field not found"
	ErrReferenceNotFound        = "reference not found"
	ErrReferenceNotDone         = "reference '%s' not done"
	ErrAggregatorNotFound       = "aggregator not found"
	ErrJobsNotFound             = "no jobs is found"
	ErrRepoSshTimeout           = "ssh timeout connecting to database"
	ErrFieldReferrerNotFound    = "referrer field not found in reference table"
	ErrFieldReferredNotFound    = "referred field not found in reference table"
	ErrInvalidUpadateReferences = "invalid update references. Just one reference is allowed"
	ErrInvalidUpdateSource      = "source and ids have different length"
	ErrInvalidUpdateFields      = "no fields field found on update"
)
