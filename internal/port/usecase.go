package port

// RunAction is a interface that represents the action to run a specific job use case
// It returns a message, a count of missing itens to process and an error
type RunAction interface {
	Run(Domain, interface{}, interface{}) (string, int64, error)
}

// UseCase is a interface that represents the use case to run
type UseCase interface {
	Run(Args) (string, error)
}
