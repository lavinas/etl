package port

// RunAction is a interface that represents the action to run
type RunAction interface {
	Run(Domain, Repository, Repository) (int64, error)
}

// UseCase is a interface that represents the use case to run
type UseCase interface {
	RunJob(int64) (int64, error)
}
