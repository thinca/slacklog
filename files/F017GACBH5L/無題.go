package main

import (
	"fmt"
	"log"

	"golang.org/x/sys/unix"
)

func main() {
	// create socket
	socket, err := unix.Socket(unix.AF_INET, unix.SOCK_STREAM, 0)
	if err != nil {
		log.Fatal(err)
	}
	if socket < 0 {
		log.Fatal("create socket failed")
	}

	// bind socket to address
	addr := unix.SockaddrInet4{
		Port: 8888,
		Addr: [4]byte{0, 0, 0, 0},
	}

	if err := unix.Bind(socket, &addr); err != nil {
		log.Fatal(err)
	}

	// listen port
	if err := unix.Listen(socket, 1); err != nil {
		log.Fatal(err)
	}
	fmt.Println("listen port 8888")

	// accept connection
	for {
		nfd, _, err := unix.Accept(socket)
		if err != nil {
			log.Fatal(err)
		}
		fmt.Println("accepted")

		fmt.Println("read start")
		var b []byte
		if _, err := unix.Read(nfd, b); err != nil {
			log.Fatal(err)
		}
		fmt.Println("read end")

		println(string(b))
	}
}