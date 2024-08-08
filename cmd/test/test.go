package main

import (
	"database/sql"
	"fmt"
	"log"
	"net"
	"os"
	"context"

	"github.com/go-sql-driver/mysql"
	"golang.org/x/crypto/ssh"
	"golang.org/x/crypto/ssh/agent"
	
	"github.com/lavinas/vooo-etl/internal/adapters/repository"
)

type ViaSSHDialer struct {
	client *ssh.Client
}

func (s *ViaSSHDialer) Dial(addr string) (net.Conn, error) {
	return s.client.Dial("tcp", addr)
}

type DatabaseCreds struct {
	SSHHost    string // SSH Server Hostname/IP
	SSHPort    int    // SSH Port
	SSHUser    string // SSH Username
	SSHKeyFile string // SSH Key file location
	DBUser     string // DB username
	DBPass     string // DB Password
	DBHost     string // DB Hostname/IP
	DBName     string // Database name
}

func main() {
	source_ssh := "root root"
	source_fmt := "%s %s"
	var ssh_user, ssh_file string
	_, err := fmt.Sscanf(source_ssh, source_fmt, &ssh_user, &ssh_file)
	if err != nil {
		log.Fatal(1, err)
	}
	fmt.Println(ssh_user, ssh_file)
}

func Main1() {
	source_dns := "root:te4356sfh@mysql+tcp(vooo-mysql:3306)"
	source_ssh := "ubuntu:file(vooo_backoffice.pem)@tcp(18.229.76.67:22)"
	repo1, err := repository.NewRepository(source_dns, source_ssh)
	if err != nil {
		log.Fatal(err)
	}
	defer repo1.Close()
}

func Main2() {
	db, sshConn, err := ConnectToDB(DatabaseCreds{
		SSHHost:    "18.229.76.67",
		SSHPort:    22,
		SSHUser:    "ubuntu",
		SSHKeyFile: "vooo_backoffice.pem",
		DBUser:     "root",
		DBPass:     "te4356sfh",
		DBHost:     "mysql.vooo.ws:3306",
		DBName:     "vooo_prod_backend",
	})
	
	if err != nil {
		log.Fatal(err)
	}
	defer sshConn.Close()
	defer db.Close()

	if rows, err := db.Query("SELECT 1=1"); err == nil {
		for rows.Next() {
			var result string
			rows.Scan(&result)
			fmt.Printf("Result: %s\n", result)
		}
		rows.Close()
	} else {
		fmt.Printf("Failure: %s", err.Error())
	}
}

// ConnectToDB will accept the db and ssh credientials (DatabaseCreds) and
// form a connection with the database (handling any errors that might arise).
func ConnectToDB(dbCreds DatabaseCreds) (*sql.DB, *ssh.Client, error) {

	// Make SSH client: establish a connection to the local ssh-agent
	var agentClient agent.Agent
	if conn, err := net.Dial("unix", os.Getenv("SSH_AUTH_SOCK")); err == nil {
		defer conn.Close()
		agentClient = agent.NewClient(conn)
	}

	pemBytes, err := os.ReadFile(dbCreds.SSHKeyFile)
	if err != nil {
		return nil, nil, err
	}
	signer, err := ssh.ParsePrivateKey(pemBytes)
	if err != nil {
		return nil, nil, err
	}

	// The client configuration with configuration option to use the ssh-agent
	sshConfig := &ssh.ClientConfig{
		User:            dbCreds.SSHUser,
		Auth:            []ssh.AuthMethod{ssh.PublicKeys(signer)},
		HostKeyCallback: ssh.InsecureIgnoreHostKey(),
	}

	// When the agentClient connection succeeded, add them as AuthMethod
	if agentClient != nil {
		sshConfig.Auth = append(sshConfig.Auth, ssh.PublicKeysCallback(agentClient.Signers))
	}

	// Connect to the SSH Server
	sshConn, err := ssh.Dial("tcp", fmt.Sprintf("%s:%d", dbCreds.SSHHost, dbCreds.SSHPort), sshConfig)
	if err != nil {
		return nil, nil, err
	}

	// Now we register the ViaSSHDialer with the ssh connection as a parameter
	mysql.RegisterDialContext("mysql+tcp", func(_ context.Context, addr string) (net.Conn, error) {
		dialer := &ViaSSHDialer{sshConn}
		return dialer.Dial(addr)
	})

	// And now we can use our new driver with the regular mysql connection string tunneled through the SSH connection
	db, err := sql.Open("mysql", fmt.Sprintf("%s:%s@mysql+tcp(%s)/%s", dbCreds.DBUser, dbCreds.DBPass, dbCreds.DBHost, dbCreds.DBName))
	if err != nil {
		return nil, sshConn, err
	}

	fmt.Println("Successfully connected to the db")

	return db, sshConn, err
}