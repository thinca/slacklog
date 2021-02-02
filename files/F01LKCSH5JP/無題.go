package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"

	"github.com/fsnotify/fsnotify"
)

func main() {
	fileName := os.Args[1]
	watcher, err := fsnotify.NewWatcher()
	if err != nil {
		log.Println("cannot watch file", err)
		return
	}
	defer watcher.Close()

	msg := make(chan []byte)

	go func() {
		for {
			select {
			case event, ok := <-watcher.Events:
				if !ok {
					return
				}

				if event.Op&fsnotify.Write == fsnotify.Write {
					if filepath.Base(event.Name) == fileName {
						b, err := ioutil.ReadFile(fileName)
						if err != nil {
							log.Println("failed to read file", err)
							return
						}

						fmt.Println(len(b))
						msg <- b
					}
				}

			case err, ok := <-watcher.Errors:
				if !ok {
					return
				}
				log.Println("watch error", err)
			}
		}
	}()

	err = watcher.Add(".")
	if err != nil {
		log.Println("failed to add watcher", err)
		return
	}

	for {
		<-msg
	}
}