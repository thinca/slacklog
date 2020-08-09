package main

import (
	"fmt"
	"io/ioutil"
	"log"

	"golang.org/x/mod/modfile"
)

func main() {
	if err := runCmd(); err != nil {
		log.Fatal(err)
	}
}

func runCmd() error {
	b, err := ioutil.ReadFile("go.mod")
	if err != nil {
		return err
	}
	f, err := modfile.Parse("go.mod", b, nil)
	if err != nil {
		return err
	}

	fmt.Println("Require:")
	for _, r := range f.Require {
		if r.Indirect {
			fmt.Printf("  + %s\n", r.Mod)
		} else {
			fmt.Printf("    %s\n", r.Mod)
		}
	}

	fmt.Println("Replace:")
	for _, r := range f.Replace {
		fmt.Printf("  %s => %s\n", r.Old, r.New)
	}
	return nil
}