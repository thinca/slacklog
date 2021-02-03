var vcsPaths = []*vcsPath{
	// Github
	{
		pathPrefix: "github.com",
		regexp:     lazyregexp.New(`^(?P<root>github\.com/[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+)(/[A-Za-z0-9_.\-]+)*$`),
		vcs:        "git",
		repo:       "https://{root}",
		check:      noVCSSuffix,
	},
