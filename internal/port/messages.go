package port

const (
	ErrRepoNilTx               = "tx informed is nil"
	ErrRepoInvalidTX           = "tx informed is invalid"
	ErrRepoNilObject           = "object informed is nil"
	ErrRepoInvalidObject       = "object informed is invalid"
	ErrRepoSshInvalid          = "ssh dns is invalid"
	ErrJobNotFound             = "no job found"
	ErrJobNotReady             = "job is not ready"
	ErrJobNotRunning           = "job is not running"
	ErrRepoPassNotImplemented  = "just file implemented"
	ErrRepoProtoNotImplemented = "just tcp implemented"
	ErrActionNotFound          = "action not found"
)
