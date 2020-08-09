// NewCLICommand creates a cli.Command, which provides "fetch-messages"
// sub-command.
func NewCLICommand() *cli.Command {
	var (
		token   string
		datadir string
		date    string
		verbose bool
	)
	return &cli.Command{
		Name:  "fetch-messages",
		Usage: "fetch messages of channel by day",
		Action: func(c *cli.Context) error {
			return run(token, datadir, date, verbose)
		},
		Flags: []cli.Flag{
			&cli.StringFlag{
				Name:        "token",
				Usage:       "slack token",
				EnvVars:     []string{"SLACK_TOKEN"},
				Destination: &token,
			},
			&cli.StringFlag{
				Name:        "datadir",
				Usage:       "directory to load/save data",
				Value:       "_logdata",
				Destination: &datadir,
			},
			&cli.StringFlag{
				Name:        "date",
				Usage:       "target date to get",
				Value:       toDateString(time.Now()),
				Destination: &date,
			},
			&cli.BoolFlag{
				Name:        "verbose",
				Usage:       "verbose log",
				Destination: &verbose,
			},
		},
	}
}