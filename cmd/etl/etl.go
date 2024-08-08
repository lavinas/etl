package main

import (
	"log"
	"os"

	"github.com/lavinas/vooo-etl/internal/adapters/handler"
	"github.com/lavinas/vooo-etl/internal/adapters/repository"
	"github.com/lavinas/vooo-etl/internal/usecase"
)

// main is the entry point of the etl application
func main() {
	// get the target repository
	repoSource, err := repository.NewRepository(os.Getenv("SOURCE_DNS"), os.Getenv("SOURCE_SSH"))
	if err != nil {
		log.Fatal(err)
	}
	defer repoSource.Close()
	// get the target repository
	repoTarget, err := repository.NewRepository(os.Getenv("TARGET_DNS"), os.Getenv("TARGET_SSH"))
	if err != nil {
		log.Fatal(err)
	}
	defer repoTarget.Close()
	// get usecase
	run := usecase.NewRun(repoSource, repoTarget)
	// get and run the handler
	handler := handler.NewLine(run)
	handler.Run()	
}
