package main

import (
	"fmt"
	"os"

	"github.com/lavinas/vooo-etl/internal/adapters/repository"
	"github.com/lavinas/vooo-etl/internal/domain"
)

func main() {
	repo, err := repository.NewRepository(os.Getenv("TARGET_DNS"), os.Getenv("TARGET_SSH"))
	if err != nil {
		panic(err)
	}
	defer repo.Close()
	tx := repo.Begin("")
	defer repo.Rollback(tx)
	job := domain.Job{Id: "200"}
	err = job.Load(repo, tx, false)
	if err != nil {
		panic(err)
	}
	fmt.Println(job)
}
