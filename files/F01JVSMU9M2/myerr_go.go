package myerr

import (
	"fmt"
	"time"

	"./internal/stack"
)

type myErr struct {
	msg    string
	args   []interface{}
	frames []*stack.Frame
	time   time.Time
}

func New(msg string, args ...interface{}) error {
	return &myErr{
		msg:    msg,
		args:   args,
		frames: stack.Frames(1),
		time:   time.Now(),
	}
}

func (m *myErr) Error() string {
	return fmt.Sprintf("[%s] %s:\n%s\n", m.time, fmt.Sprintf(m.msg, args...), stack.Join(m.frames))
}