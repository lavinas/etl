package port

import (
	"gorm.io/gorm/logger"
	"math"
	"time"
)

// messages
const (
	ErrRepoNilTx                = "tx informed is nil"
	ErrRepoInvalidTX            = "tx informed is invalid"
	ErrRepoNilObject            = "object informed is nil"
	ErrRepoInvalidObject        = "object informed is invalid"
	ErrRepoSshInvalid           = "ssh dns is invalid"
	ErrJobNotFound              = "job not found"
	ErrJobNotReady              = "job is not ready"
	ErrJobNotRunning            = "job is not running"
	ErrRepoPassNotImplemented   = "just file implemented"
	ErrRepoProtoNotImplemented  = "just tcp implemented"
	ErrActionNotFound           = "action not found"
	ErrJobTypeNotImplemented    = "job type not implemented"
	ErrFieldNotFound            = "field not found"
	ErrReferenceNotFound        = "reference not found"
	ErrReferenceNotDone         = "reference '%s' not done"
	ErrAggregatorNotFound       = "aggregator not found"
	ErrJobsNotFound             = "no jobs is found"
	ErrRepoSshTimeout           = "ssh timeout connecting to database"
	ErrFieldReferrerNotFound    = "referrer field not found in reference table"
	ErrFieldReferredNotFound    = "referred field not found in reference table"
	ErrInvalidUpadateReferences = "invalid update references. Just one reference is allowed"
	ErrInvalidUpdateSource      = "source and ids have different length"
	ErrInvalidUpdateFields      = "no fields field found on update"
	ErrTimeout                  = "timeout"
	ErrInterrupted              = "interrupted"
	ErrJobKeyNotFound           = "job key not found"
	ErrKeysLength               = "keys length is different"
	ErrSetupSchemaEmpty         = "schema is empty"
	ErrNoTablesFound            = "no tables found"
	ErrTableReferceNotFound     = "table reference %s not found"
	ErrCircularReference        = "circular reference in table %s"
)

// queries
const (
	CopyDisableFK        = "SET FOREIGN_KEY_CHECKS = 0;"
	CopyEnableFK         = "SET FOREIGN_KEY_CHECKS = 1;"
	CopyMaxClient        = "SELECT max(%s) FROM %s;"
	CopySelectAll        = "SELECT * FROM %s.%s WHERE (%s) in (%s) order by %s;"
	CopySelectF          = "SELECT %s FROM %s.%s WHERE %s > %d and %s <= %d;"
	CopyInsert           = "REPLACE INTO %s.%s %s VALUES %s;"
	LoadClientAggregator = "SELECT id FROM aggregator_ref;"
	LoadClientSelect     = "SELECT id FROM client WHERE id_aggregator in (%s) and id > %d and id <= %d order by id;"
	LoadClientInsert     = "INSERT IGNORE INTO client_ref VALUES %s;"
	LoadClientMax        = "SELECT max(id) FROM client;"
	UpdateDisableFK      = "SET FOREIGN_KEY_CHECKS = 0;"
	UpdateEnableFK       = "SET FOREIGN_KEY_CHECKS = 1;"
	UpdateGetFields      = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '%s' AND TABLE_NAME = '%s';"
	UpdateSelectID1      = "SELECT %s, md5(concat(%s)) FROM %s.%s WHERE %s > %d and %s <= %d order by 1;"
	UpdateSelectID2      = "SELECT %s, md5(concat(%s)) FROM %s.%s WHERE (%s) in (%s) order by 1;"
	UpdateSelectAll      = "SELECT * FROM %s.%s WHERE (%s) in (%s);"
	UpdateInsert         = "REPLACE INTO %s.%s(%s) VALUES %s;"
	SetupDisableFK     = "SET FOREIGN_KEY_CHECKS = 0;"
	SetupEnableFK      = "SET FOREIGN_KEY_CHECKS = 1;"
	SetUpSelectTables  = "SELECT table_schema, table_name from information_schema.tables where table_schema = '%s' and not (%s) order by 1,2;"
	SetUpSelectPrime   = "SELECT table_name, column_name FROM information_schema.columns WHERE table_schema = '%s' AND table_name in (%s) AND column_key = 'PRI';"
	SetUpSelecrForeign = "SELECT referrer_table, referrer_field, referenced_schema, referenced_table, referenced_field FROM ref_init WHERE referrer_schema = '%s' AND referrer_table in (%s);"
	SetUpExcepts	   = "SELECT stat FROM expts;"
)

// domain variables
var (
	Int64Nil = int64(math.MinInt64)
)

// usecases variables
var (
	RunTimeout           = 30 * time.Second
	DbRelief             = 0 * time.Millisecond
	LoadClientSourceBase = "vooo_prod_backend"
	CopySourceBase       = "vooo_prod_backend"
	UpdateReturnMessage  = "%d processed, %d updated"
	CopyReturnMessage    = "%d rows processed, %d copied, %d missing"
	InLimit              = int64(5000)
)

// MySQL variables
var (
	LoggerType        = logger.Default.LogMode(logger.Silent)
	ConnectionTimeout = time.Second * 5
)
