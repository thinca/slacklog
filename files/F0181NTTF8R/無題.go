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
	defer unix.Close(socket)

	//L:
	// accept connection
	for {
		nfd, _, err := unix.Accept(socket)
		if err != nil {
			log.Fatal(err)
		}
		fmt.Println("accepted")

		for {
			b := make([]byte, 1024)
			i, err := unix.Read(nfd, b)
			if err != nil {
				log.Fatal(err)
			}

			if i == 0 {
				break
			}

			print(string(b))
			unix.Write(nfd, []byte("recived: "+string(b)))
		}
		unix.Close(nfd)
		print("closed")
	}
}
