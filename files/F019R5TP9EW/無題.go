package main

import (
	"context"
	"io"
	"log"
	"os"
	"sync"
	"time"

	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
	"golang.org/x/crypto/ssh/terminal"
)

type onlyWriter struct{ io.Writer }

func main() {
	os.Setenv("DOCKER_API_VERSION", "1.40")
	cli, err := client.NewEnvClient()
	if err != nil {
		log.Fatal(err)
	}

	ctx := context.Background()

	run := func() {
		response, err := cli.ContainerExecCreate(ctx, "golang", types.ExecConfig{
			Tty:          true,
			AttachStdin:  true,
			AttachStderr: true,
			AttachStdout: true,
			Cmd:          []string{"bash"},
		})

		if err != nil {
			log.Fatal(err)
		}

		resp, err := cli.ContainerExecAttach(ctx, response.ID, types.ExecStartCheck{Tty: true})
		if err != nil {
			log.Fatal(err)
		}
		defer resp.Close()

		old, err := terminal.MakeRaw(int(os.Stdin.Fd()))
		if err != nil {
			log.Fatal(err)
		}
		defer func() { _ = terminal.Restore(int(os.Stdin.Fd()), old) }()

		pr, pw := io.Pipe()
		rr, ww := io.Pipe()

		var once sync.Once
		close := func() {
			once.Do(func() {
				pr.Close()
				pw.Close()
				rr.Close()
				ww.Close()
				println("close pipe")
			})
		}

		go func() {
			io.Copy(pw, os.Stdin)
			println("stdin")
			close()
		}()

		go func() {
			io.Copy(resp.Conn, pr)
			println("resp.Conn")
			close()
		}()

		go func() {
			io.Copy(ww, resp.Reader)
			println("resp.Reader")
			close()
		}()
		io.Copy(onlyWriter{os.Stdout}, rr)
		println("stdout")
	}
	run()
}