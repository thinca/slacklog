package main

import (
	"bufio"
	"compress/bzip2"
	"encoding/xml"
	"errors"
	"io"
	"log"
	"os"
	"time"
)

func readAllTokens(name string) error {
	f, err := os.Open(name)
	if err != nil {
		return err
	}
	defer f.Close()
	r1 := bufio.NewReader(f)
	r2 := bzip2.NewReader(r1)
	d := xml.NewDecoder(r2)
	st := time.Now()
	defer func() {
		log.Printf("took %s", time.Since(st))
	}()
	log.Printf("start")
	var progress int64 = 0
	for {
		tok, err := d.Token()
		if err != nil {
			if errors.Is(err, io.EOF) {
				break
			}
			return err
		}
		switch tok.(type) {
		case xml.StartElement:
			progress++
			if progress%1000000 == 0 {
				log.Printf("progress: %d", progress)
			}
		}
	}
	return nil
}

func main() {
	err := readAllTokens("kanto-latest.osm.bz2")
	if err != nil {
		log.Fatal(err)
	}
}