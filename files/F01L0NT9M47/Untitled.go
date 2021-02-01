if d := cmp.Diff(want, got); d != "" {
	t.Errorf("foo mismatch: -want +got\n%s", d)
}