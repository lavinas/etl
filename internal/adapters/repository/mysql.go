package repository

import (
	"errors"
	"reflect"
	"unicode"
	"fmt"
	"net"
	"os"
	"context"
	"database/sql"

	gmysql "gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
	"gorm.io/gorm/logger"

	"github.com/go-sql-driver/mysql"
	"golang.org/x/crypto/ssh/agent"
	"golang.org/x/crypto/ssh"

	"github.com/lavinas/vooo-etl/internal/port"
	"github.com/lavinas/vooo-etl/pkg"
)


const (
	ssh_key = "%s:file(%s)@tcp(%s:%s)"
)


type ViaSSHDialer struct {
	client *ssh.Client
}

func (s *ViaSSHDialer) Dial(addr string) (net.Conn, error) {
	return s.client.Dial("tcp", addr)
}


// RepoMySql is the repository handler for the application
type MySql struct {
	Db *gorm.DB
}

// NewRepository creates a new repository handler
func NewRepository(dns string, sshDns string) (*MySql, error) {
	var sshUser, sshKfile, sshHost, sshPort string
	if sshDns != "" {
		if _, err := fmt.Sscanf(sshDns, ssh_key, &sshUser, &sshKfile, &sshHost, &sshPort); err != nil {
			return nil, err
		}
		var agentClient agent.Agent
		if conn, err := net.Dial("unix", os.Getenv("SSH_AUTH_SOCK")); err == nil {
			defer conn.Close()
			agentClient = agent.NewClient(conn)
		}

		pemBytes, err := os.ReadFile(sshKfile)
		if err != nil {
			return nil, err
		}
		signer, err := ssh.ParsePrivateKey(pemBytes)
		if err != nil {
			return nil,  err
		}
	
		// The client configuration with configuration option to use the ssh-agent
		sshConfig := &ssh.ClientConfig{
			User:            sshUser,
			Auth:            []ssh.AuthMethod{ssh.PublicKeys(signer)},
			HostKeyCallback: ssh.InsecureIgnoreHostKey(),
		}
	
		// When the agentClient connection succeeded, add them as AuthMethod
		if agentClient != nil {
			sshConfig.Auth = append(sshConfig.Auth, ssh.PublicKeysCallback(agentClient.Signers))
		}
	
		// Connect to the SSH Server
		sshConn, err := ssh.Dial("tcp", fmt.Sprintf("%s:%s", sshHost, sshPort), sshConfig)
		if err != nil {
			return nil, err
		}
	
		// Now we register the ViaSSHDialer with the ssh connection as a parameter
		mysql.RegisterDialContext("mysql+tcp", func(_ context.Context, addr string) (net.Conn, error) {
			dialer := &ViaSSHDialer{sshConn}
			return dialer.Dial(addr)
		})
	}
		
	db, err := sql.Open("mysql", dns)
	if err != nil {
		return nil, err
	}
	config := gorm.Config{Logger: logger.Default.LogMode(logger.Silent)}
	gormDb, err := gorm.Open(gmysql.New(gmysql.Config{Conn: db}), &config)
	if err != nil {
		return nil, err
	}
	return &MySql{Db: gormDb}, nil
}

// Close closes the database connection
func (r *MySql) Close() {
	db, err := r.Db.DB()
	if err != nil {
		return
	}
	db.Close()
}

// Migrate migrates the database
// it receives a slice of interfaces that represents the domain
func (r *MySql) Migrate(domain []interface{}) error {
	for _, d := range domain {
		if err := r.Db.AutoMigrate(d); err != nil {
			return err
		}
	}
	return nil
}

// Begin is a method that starts a transaction
// it returns an object that represents a transaction to be used in others methods
func (r *MySql) Begin() interface{} {
	return r.Db.Begin()
}

// Commit commits the transaction
// it receives a string that represents the transaction name
func (r *MySql) Commit(tx interface{}) error {
	if tx == nil {
		return errors.New(port.ErrRepoNilTx)
	}
	stx, ok := tx.(*gorm.DB)
	if !ok {
		return errors.New(port.ErrRepoInvalidTX)
	}
	stx = stx.Commit()
	if stx.Error != nil {
		return stx.Error
	}
	return nil
}

// Rollback rolls back the transaction
// it receives a transaction generate by Begin method
func (r *MySql) Rollback(tx interface{}) error {
	if tx == nil {
		return errors.New(port.ErrRepoNilTx)
	}
	stx, ok := tx.(*gorm.DB)
	if !ok {
		return errors.New(port.ErrRepoInvalidTX)
	}
	stx = stx.Rollback()
	if stx.Error != nil {
		return stx.Error
	}
	return nil
}

// Add adds a object to the database
// it receives the object and the transaction
// transaction have to be started before calling this method
func (r *MySql) Add(tx interface{}, obj interface{}) error {
	stx, err := r.format(tx, obj)
	if err != nil {
		return err
	}
	stx = stx.Session(&gorm.Session{})
	stx.Create(obj)
	if stx.Error != nil {
		return stx.Error
	}
	return nil
}

// Get gets a object from the database by id
// it receives the object, the id and the transaction
// transaction have to be started before calling this method
func (r *MySql) Get(tx interface{}, obj interface{}, id string, lock bool) (bool, error) {
	stx, err := r.format(tx, obj)
	if err != nil {
		return false, err
	}
	stx = stx.Session(&gorm.Session{})
	if lock {
		if stx = stx.Clauses(clause.Locking{Strength: "UPDATE"}); stx.Error != nil {
			return false, stx.Error
		}
	}
	stx = stx.Table(obj.(port.Domain).TableName()).First(obj, "ID = ?", id)
	if stx.Error == nil {
		return true, nil
	}
	if errors.Is(stx.Error, gorm.ErrRecordNotFound) {
		return false, nil
	}
	return false, stx.Error
}

// Find gets all objects from the database matching the object
// obj represents an object to filter the query and limit is the maximum number of objects to return
// Tx is the transaction name and extras are extra filters commands to the query
// transaction have to be started before calling this method
// The function returns the objects, a boolean indicating if the limit was crossed and an error
// Use -1 to cancel the limit
func (r *MySql) Find(tx interface{}, obj interface{}, limit int, lock bool, extras ...interface{}) (interface{}, bool, error) {
	stx, err := r.format(tx, obj)
	if err != nil {
		return nil, false, err
	}
	result, err := r.find(stx, obj, limit, lock, extras...)
	if err != nil {
		return nil, false, err
	}
	if reflect.ValueOf(result).Elem().Len() == 0 {
		return nil, false, nil
	}
	crossLimit := false
	if limit > 0 && reflect.ValueOf(result).Elem().Len() > limit {
		reflect.ValueOf(result).Elem().SetLen(limit)
		crossLimit = true
	}
	return result, crossLimit, nil
}

// Save saves a object to the database
// it receives the object and the transaction
// transaction have to be started before calling this method
func (r *MySql) Save(tx interface{}, obj interface{}) error {
	stx, err := r.format(tx, obj)
	if err != nil {
		return err
	}
	stx = stx.Session(&gorm.Session{})
	stx = stx.Save(obj)
	if stx.Error != nil {
		return stx.Error
	}
	return nil
}

// Delete deletes a object from the database by id
// it receives the object, the id and the transaction name
// Tx is the transaction name and extras are extra filters commands to the query
// transaction have to be started before calling this method
func (r *MySql) Delete(tx interface{}, obj interface{}, extras ...interface{}) error {
	stx, err := r.format(tx, obj)
	if err != nil {
		return err
	}
	stx = stx.Session(&gorm.Session{})
	stx, err = r.where(stx, reflect.TypeOf(obj).Elem(), obj, extras...)
	if err != nil {
		return err
	}
	stx = stx.Delete(obj)
	if stx.Error != nil {
		return stx.Error
	}
	return nil
}

// find finds object based on obj, limit and extras params
func (r *MySql) find(stx *gorm.DB, obj interface{}, limit int, lock bool, extras ...interface{}) (interface{}, error) {
	stx = stx.Session(&gorm.Session{})
	sob := reflect.TypeOf(obj).Elem()
	var err error
	stx, err = r.where(stx, sob, obj, extras...)
	if err != nil {
		return nil, err
	}
	if limit > 0 {
		stx = stx.Limit(limit + 1)
	}
	result := reflect.New(reflect.SliceOf(sob)).Interface()
	if lock {
		if stx = stx.Clauses(clause.Locking{Strength: "UPDATE"}); stx.Error != nil {
			return nil, err
		}
	}
	if stx = stx.Find(result); stx.Error != nil {
		return nil, stx.Error
	}
	return result, nil
}

// format formats input parameters
func (r *MySql) format(tx interface{}, obj interface{}) (*gorm.DB, error) {
	if tx == nil {
		return nil, errors.New(port.ErrRepoNilTx)
	}
	if obj == nil {
		return nil, errors.New(port.ErrRepoNilObject)
	}
	stx, ok := tx.(*gorm.DB)
	if !ok {
		return nil, errors.New(port.ErrRepoInvalidTX)
	}
	if _, ok := obj.(port.Domain); !ok {
		return nil, errors.New(port.ErrRepoInvalidObject)
	}
	return stx, nil
}

// where is a method that filters the query
func (r *MySql) where(tx *gorm.DB, sob reflect.Type, base interface{}, extras ...interface{}) (*gorm.DB, error) {
	if sob.Kind() == reflect.Ptr {
		sob = sob.Elem()
	}
	for i := 0; i < sob.NumField(); i++ {
		isgorm := sob.Field(i).Tag.Get("gorm")
		if isgorm == "-" || isgorm == "" {
			continue
		}
		elem := reflect.ValueOf(base).Elem().Field(i).Interface()
		if pkg.IsEmpty(elem) {
			continue
		}
		fName := r.fieldName(sob.Field(i).Name)
		tx = tx.Where(fName+" = ?", elem)
		if i == 0 {
			tx = tx.Session(&gorm.Session{})
		}
	}
	for _, extra := range extras {
		tx = tx.Where(extra)
	}
	return tx, nil
}

// fieldName is a method that returns the field name
func (r *MySql) fieldName(field string) string {
	ret := ""
	isLower := false
	for _, ch := range field {
		if unicode.IsUpper(ch) && isLower {
			ret += "_"
		}
		isLower = unicode.IsLower(ch)
		ret += string(unicode.ToLower(ch))
	}
	return ret
}
