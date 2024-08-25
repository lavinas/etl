package port

// Domain is an interface that represents the domain entity
type Domain interface {
	// TableName is a method that returns the table name of the domain entity
	TableName() string
}
