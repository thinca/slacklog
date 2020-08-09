package main

import (
	"fmt"
)

type Foo struct{}

func main() {
	a := &Foo{}
	b := &Foo{}
	fmt.Println(a == b)

	// この行のコメントを外すと↑が true になる
	//fmt.Printf("%p %p", a, b)
}