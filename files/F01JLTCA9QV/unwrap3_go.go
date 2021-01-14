for {
	err = errors.Unwrap(err)
	if err == nil {
		break
	}
	// work with `err` ...
}