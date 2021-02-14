package main

import "testing"

func Benchmark1(b *testing.B) {
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		reverseSHA256("6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b")
	}
}

func Benchmark2(b *testing.B) {
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		reverseSHA256("fb8e20fc2e4c3f248c60c39bd652f3c1347298bb977b8b4d5903b85055620603")
	}
}

func Benchmark3(b *testing.B) {
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		reverseSHA256("ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")
	}
}