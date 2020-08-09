package main

import (
	"reflect"
	"testing"
)

const (
	N, M = 100, 200
)

func genSlicesMakeInLoop() [][]int {
	xss := make([][]int, N)
	for j := range xss {
		xss[j] = make([]int, M)
	}
	return xss
}

func genSlicesMakeOutLoop() [][]int {
	xs := make([]int, N*M)
	xss := make([][]int, N)
	for j := range xss {
		xss[j] = xs[j*M : (j+1)*M]
	}
	return xss
}

func TestSlices(t *testing.T) {
	got1, got2 := genSlicesMakeInLoop(), genSlicesMakeOutLoop()
	if !reflect.DeepEqual(got1, got2) {
		t.Errorf("\n%v\n%v", got1, got2)
	}
}

func BenchmarkSlicesMakeInLoop(b *testing.B) {
	for i := 0; i < b.N; i++ {
		genSlicesMakeInLoop()
	}
}

func BenchmarkSlicesMakeOnce(b *testing.B) {
	for i := 0; i < b.N; i++ {
		genSlicesMakeOutLoop()
	}
}