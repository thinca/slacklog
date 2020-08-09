var reCode = regexp.MustCompile("(`(?:``)?)([^`]+?)${1}")
reCode.ReplaceAllString("`xxx `foo` yyy", "<code>${2}</code>") // <code>foo</code>
reCode.ReplaceAllString("`xxx ```foo```
yyy", "<code>${2}</code>") // <code>foo</code>