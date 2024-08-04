package domain

// Control represents the control entity of application
type Job struct {
	Id          int
	Type        string
	Action      string
	Object      string
	Base        string
	Last        int64
	Status      string
	Lock		bool
}
