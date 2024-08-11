package port

// RunAction is a interface that represents the action to run
type RunAction interface {
	Run(Domain, map[string]Domain, Repository, Repository, interface{}) (string, error)
}

// UseCase is a interface that represents the use case to run
type UseCase interface {
	RunJob(int64) (string, error)
}
