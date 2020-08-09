package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"regexp"
	"sync"
)

var (
	wg         sync.WaitGroup
	results    = make(chan []string)
	outputDone = make(chan struct{})
)

func grep(path string, re *regexp.Regexp) {
	defer wg.Done()
	h, err := os.Open(path)
	if err != nil {
		log.Printf("can't access %s", path)
	}
	s := bufio.NewScanner(h)

	lnum := 0
	var matches []string
	for s.Scan() {
		lnum++
		t := s.Text()
		if re.MatchString(t) {
			res := fmt.Sprintf("%s:%d: %s", path, lnum, t)
			matches = append(matches, res)
		}
	}

	if len(matches) != 0 {
		results <- matches
	}
}

func output() {
	for r := range results {
		for _, m := range r {
			fmt.Println(m)
		}
	}
	outputDone <- struct{}{}
}

func run() error {
	re := regexp.MustCompile(os.Args[1])
	err := filepath.Walk(".", func(path string, info os.FileInfo, err error) error {
		if err != nil {
			fmt.Printf("prevent panic by handling failure accessing a path %q: %v\n", path, err)
			return err
		}

		if info.Mode().IsRegular() {
			wg.Add(1)
			go grep(path, re)
		}

		return nil
	})
	if err != nil {
		return err
	}
	go output()
	wg.Wait()
	close(results)
	<-outputDone
	return nil
}

func main() {
	err := run()
	if err != nil {
		log.Fatal(err)
	}
}