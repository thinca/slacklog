package main

import (
	"context"
	"time"
)

type Gorilla interface {
	Uho()
}

type f struct {
	c context.Context
}

func (f *f) Uho() {
	select {
	case <-f.c.Done():
		println("ウホ")
	default:
	}
	time.Sleep(3 * time.Second)
}

func main() {
	p := context.Background()
	c, cancel := context.WithCancel(p)
	go func() {
		(&f{c: c}).Uho()
	}()
	cancel()
	time.Sleep(2 * time.Second)
}