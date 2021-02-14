package main

import (
	"bytes"
	"crypto/sha256"
	"encoding/hex"
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

func (c counter) bytes() []byte {
	for i := 0; i < len(c); i++ {
		if c[i] != 0 {
			return c[i:]
		}
	}
	return c[:1]
}

func main() {
	if len(os.Args) < 2 {
		log.Fatal("please set target hash")
	}
	hash, err := hex.DecodeString(os.Args[1])
	if err != nil {
		log.Fatalf("invalid hash: %s", err)
	} else if len(hash) != 32 {
		log.Fatalf("invalid hash length: required 32 bytes (256 bits) but got %d", len(hash))
	}

	var c counter
	start := time.Now()
	for {
		input := c.bytes()
		b := sha256.Sum256(input)
		if bytes.Equal(b[:], hash) {
			fmt.Printf("resolved! result is %s\n", string(input))
			break
		}
		if !c.inc() {
			log.Fatal("not found")
		}
	}
	d := time.Since(start)
	log.Printf("elapsed %s", d)
}