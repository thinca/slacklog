package main

import (
	"bytes"
	"strings"
	"crypto/sha256"
	"encoding/hex"
	"errors"
	"fmt"
	"log"
	"os"
	"time"
)

type counter [32]byte

func (c *counter) inc() bool {
	for i := len(c) - 1; i >= 0; i-- {
		c[i]++
		if c[i] != 0 {
			return true
		}
	}
	return false
}

func (c *counter) input() string {
	return strings.TrimLeft(hex.EncodeToString(c[:]), "0")
}

func reverseSHA256(s string) (string, error) {
	hash, err := hex.DecodeString(s)
	if err != nil {
		return "", fmt.Errorf("invalid hash: %w", err)
	}
	if len(hash) != 32 {
		return "", fmt.Errorf("invalid hash length: required 32 bytes (256 bits) but got %d", len(hash))
	}
	var c counter
	for {
		input := c.input()
		b := sha256.Sum256([]byte(input))
		if bytes.Equal(b[:], hash) {
			return input, nil
		}
		if !c.inc() {
			return "", errors.New("not found")
		}
	}
}

func main() {
	if len(os.Args) < 2 {
		log.Fatal("please set target hash")
	}
	start := time.Now()
	input, err := reverseSHA256(os.Args[1])
	d := time.Since(start)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("resolved! result is %s\n", input)
	log.Printf("elapsed %s", d)
}