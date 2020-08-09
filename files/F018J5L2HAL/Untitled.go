func genSlicesMakeOutLoop() [][]int {
	xs := make([]int, N*M)
	xss := make([][]int, N)
	for j := range xss {
		max := (j + 1) * M
		xss[j] = xs[j*M : max : max]
	}
	return xss
}