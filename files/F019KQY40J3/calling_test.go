package calling

import "testing"

func pureFunc() error {
	return nil
}

func Benchmark_PureFunc(b *testing.B) {
	for i := 0; i < b.N; i++ {
		pureFunc()
	}
}

type someObj struct {
}

func (someObj) methodFunc() error {
	return nil
}

func Benchmark_ObjectMethod(b *testing.B) {
	o := someObj{}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		o.methodFunc()
	}
}

func Benchmark_FuncVar(b *testing.B) {
	f := pureFunc
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		f()
	}
}

type methoder interface {
	methodFunc() error
}

func Benchmark_Interface(b *testing.B) {
	var m methoder = someObj{}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		m.methodFunc()
	}
}

var m123 methoder = someObj{}

func Benchmark_FuncVar_Interface(b *testing.B) {
	var f func() error = m123.methodFunc
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		f()
	}
}