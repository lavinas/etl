package port

// RunAction is a interface that represents the action to run
type RunAction interface {
	Run(Domain, Repository, Repository) error
}