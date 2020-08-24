func main() {
	a := a()
	b := b()

L:
	for {
		select {
		case <-a:
			println(1)
		case <-b:
			println(2)
			break L
		}
	}
}

func a() <-chan error {
	done := make(chan error, 1)

	func() {
		time.Sleep(1 * time.Second)
		done <- nil
		close(done)
	}()

	return done
}

func b() <-chan error {
	done := make(chan error, 1)

	func() {
		time.Sleep(2 * time.Second)
		done <- nil
		close(done)
	}()

	return done
}
