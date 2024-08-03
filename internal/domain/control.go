package domain

// Control represents the control entity of application
type Control struct {
	ClientID     int64 `gorm:"type:bigint;primary_key;auto_increment:false;not null"`
	ConnectorID  int64 `gorm:"type:bigint;primary_key;auto_increment:false;not null"`
	DocumentID   int64 `gorm:"type:bigint"`
	UserID       int64 `gorm:"type:bigint"`
	ConnectionID int64 `gorm:"type:bigint"`
}
