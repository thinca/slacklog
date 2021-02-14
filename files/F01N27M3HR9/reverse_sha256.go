package main

import (
	"bytes"
	"crypto/sha256"
	"encoding/hex"
	"errors"
	"fmt"
	"log"
	"os"
	"time"
)

type counter struct {
	b [32]byte
	s [64]byte
}

func (c *counter) inc() bool {
	for i := len(c.b) - 1; i >= 0; i-- {
		c.b[i]++
		if c.b[i] != 0 {
			return true
		}
	}
	return false
}

func (c *counter) input() []byte {
	hex.Encode(c.s[:], c.b[:])
	for i := 0; i < len(c.s); i++ {
		if c.s[i] != '0' {
			return c.s[i:]
		}
	}
	return []byte{}
}

func reverseSHA256(s string) ([]byte, error) {
	hash, err := hex.DecodeString(s)
	if err != nil {
		return nil, fmt.Errorf("invalid hash: %w", err)
	}
	if len(hash) != 32 {
		return nil, fmt.Errorf("invalid hash length: required 32 bytes (256 bits) but got %d", len(hash))
	}
	var c counter
	for {
		input := c.input()
		b := sha256.Sum256(input)
		if bytes.Equal(b[:], hash) {
			return input, nil
		}
		if !c.inc() {
			return nil, errors.New("not found")
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
	fmt.Printf("resolved! result is %s\n", string(input))
	log.Printf("elapsed %s", d)
}