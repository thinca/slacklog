package main

import (
	"database/sql"
	"fmt"
	"log"
	"time"

	_ "github.com/lib/pq"
)

func run() error {
	db, err := sql.Open("postgres", "postgres://postgres:abcd1234@127.0.0.1/pg?sslmode=disable")
	if err != nil {
		return err
	}
	defer db.Close()

	now := time.Now()
	fmt.Printf("now: %v\n", now)

	err = write(db, 9999, now)
	if err != nil {
		return err
	}
	err = read(db, 9999)
	if err != nil {
		return err
	}
	return nil
}

func write(db *sql.DB, id int64, expire_at time.Time) error {
	_, err := db.Exec(`INSERT INTO api_key (id, token, expire_at) VALUES ($1, $2, $3)`, id, "foobar", expire_at)
	return err
}

func read(db *sql.DB, id int64) error {
	rs, err := db.Query(`SELECT expire_at FROM api_key WHERE id = $1`, id)
	if err != nil {
		return err
	}
	defer rs.Close()

	for rs.Next() {
		var v time.Time
		err := rs.Scan(&v)
		if err != nil {
			rs.Close()
			return err
		}
		fmt.Printf("expire_at: %v\n", v)
	}
	return nil
}

func main() {
	err := run()
	if err != nil {
		log.Fatal(err)
	}
}