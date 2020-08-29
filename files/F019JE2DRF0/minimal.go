package main

import (
	"io"
	"os"
	"sync"
	"time"
)

func main() {
	var wg sync.WaitGroup
	wg.Add(1)
	go func() {
		io.Copy(os.Stdout, os.Stdin)
		wg.Done()
	}()
	time.Sleep(1 * time.Second)
	println("HERE")
	os.Stdin.Close()
	wg.Wait()
}