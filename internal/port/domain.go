package port

// Domain is an interface that represents the domain entity
type Domain interface {
	// TableName returns the table name of the domain entity
	TableName() string
}
