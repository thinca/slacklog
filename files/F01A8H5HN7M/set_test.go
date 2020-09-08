package main

import (
	"math/rand"
	"testing"
)

func setupSlice(n int) []int {
	slice := make([]int, n)
	for i := 0; i < n; i++ {
		slice[i] = rand.Intn(n * 2)
	}
	return slice
}

func Benchmark_InSlice(b *testing.B) {
	slice := setupSlice(1000000)
	b.ResetTimer()
	count := 0
	for i := 0; i < b.N; i++ {
		for _, s := range slice {
			if s == i {
				count++
				break
			}
		}
	}
	//b.Logf("count=%d", count)
}

func setupSet(n int) map[int]struct{} {
	set := make(map[int]struct{}, n)
	for i := 0; i < n; i++ {
		set[rand.Intn(n*2)] = struct{}{}
	}
	return set
}

func Benchmark_InMap(b *testing.B) {
	set := setupSet(1000000)
	b.ResetTimer()
	count := 0
	for i := 0; i < b.N; i++ {
		if _, ok := set[i]; ok {
			count++
		}
	}
	//b.Logf("count=%d", count)
}