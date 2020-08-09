package main

import (
	"fmt"
	"time"
)

func main() {
	ch := make(chan int)

	speak := func() {
		fmt.Println("aiueo")
		ch <- 1
	}

	go speak()

	for {
		<-ch
		time.Sleep(3 * time.Second)
		go speak()
	}
}
