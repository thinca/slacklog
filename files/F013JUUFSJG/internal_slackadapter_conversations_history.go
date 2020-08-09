package slackadapter

import (
	"time"

	"github.com/vim-jp/slacklog-generator/internal/slacklog"
)

type Error struct {
	Ok  bool
	Err string `json:"error"`
}

func (err *Error) Error() string {
	return err.Err
}

type ConversationHistoryParams struct {
	Cursor    string
	Inclusive bool
	Latest    *time.Time
	Limit     int
	Oldest    *time.Time
}

type ConversationHistoryReponse struct {
	Ok               bool
	Messages         []*slacklog.Message
	HasMore          bool
	PinCount         int
	ResponseMetadata *NextCursor
}

type NextCursor struct {
	NextCursor string
}

func ConversationHistory(token, channel string, params ConversationHistoryParams) (*ConversationHistoryReponse, error) {
	// TODO:
	return nil, nil
}