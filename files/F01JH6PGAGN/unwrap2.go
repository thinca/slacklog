unwrapped := err
for (unwrapped = errors.Unwrap(unwrapped) != nil {
	// work with `unwrapped` ...
}
