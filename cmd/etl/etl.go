package main

import (
	"log"
	"os"
	"os/signal"

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
	// interrupt signal
	sig := make(chan os.Signal, 1)
	defer close(sig)
	signal.Notify(sig, os.Interrupt)
	// get usecase
	usecase := usecase.NewUseCase(repoSource, repoTarget, sig)
	// get and run the handler
	handler := handler.NewLine(usecase)
	handler.Run()
}
