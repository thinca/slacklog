package rfilter

import "xorm.io/xorm"

// Filter applies a filter to repository
type Filter interface {
	// ApplyXorm applies a filter for xorm.Session
	ApplyXorm(*xorm.Session) *xorm.Session
}

// Filters is an array of filters.
type Filters []Filter

// ApplyXorm applies a filter for xorm.Session
func (fa Filters) ApplyXorm(s *xorm.Session) *xorm.Session {
	for _, f := range fa {
		if f == nil {
			continue
		}
		s = f.ApplyXorm(s)
	}
	return s
}

// Append appends a Filter to Filters.
func (fa *Filters) Append(f Filter) *Filters {
	if f != nil {
		*fa = append(*fa, f)
	}
	return fa
}

// Nop is a filter do nothing.
type Nop struct{}

// ApplyXorm applies a filter for xorm.Session
func (Nop) ApplyXorm(s *xorm.Session) *xorm.Session {
	return s
}

// Limit is " LIMIT ... OFFSET ..." filter
type Limit struct {
	Limit  int
	Offset int
}

// ApplyXorm applies a filter for xorm.Session
func (f *Limit) ApplyXorm(s *xorm.Session) *xorm.Session {
	return s.Limit(f.Limit, f.Offset)
}

// Table is table filter.
type Table string

// ApplyXorm applies a filter for xorm.Session
func (f Table) ApplyXorm(s *xorm.Session) *xorm.Session {
	return s.Table(string(f))
}

// Cols is columns filter.
type Cols []string

// ApplyXorm applies a filter for xorm.Session
func (f Cols) ApplyXorm(s *xorm.Session) *xorm.Session {
	return s.Cols(f...)
}
