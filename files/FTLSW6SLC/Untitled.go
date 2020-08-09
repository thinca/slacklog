if s := cmp.Diff(a, b); s != "" {
	// 違いがあった場合
    fmt.Println(s)
}