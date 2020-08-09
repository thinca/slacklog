// If no version suffix is specified, assume @upgrade.
// If -u=patch was specified, assume @patch instead.
if vers == "" {
	if getU != "" {
		vers = string(getU)
	} else {
		vers = "upgrade"
	}
}