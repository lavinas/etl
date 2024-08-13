package port

type Args interface {
	GetParams() map[string]interface{}
}