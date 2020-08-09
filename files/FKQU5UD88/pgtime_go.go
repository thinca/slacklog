package main

import (
	"database/sql"
	"fmt"
	"log"
	"time"

	_ "github.com/lib/pq"
	"golang.org/x/xerrors"
)

func run() error {
	db, err := sql.Open("postgres", "postgres://postgres:abcd1234@127.0.0.1/pg?sslmode=disable")
	if err != nil {
		return err
	}
	defer db.Close()

	rs, err := db.Query(`SELECT expire_at FROM api_key WHERE id = 122`)
	if err != nil {
		return xerrors.Errorf("failed to query: %w", err)
	}
	for rs.Next() {
		var v time.Time
		err := rs.Scan(&v)
		if err != nil {
			rs.Close()
			return err
		}
		fmt.Printf("date: %v\n", v)
	}
	rs.Close()
	return nil
}

func main() {
	err := run()
	if err != nil {
		log.Fatal(err)
	}
}