	outreq := req.Clone(ctx)
	if req.ContentLength == 0 {
		outreq.Body = nil // Issue 16036: nil Body for http.Transport retries
	}
	if outreq.Header == nil {
		outreq.Header = make(http.Header) // Issue 33142: historical behavior was to always allocate
	}

	p.Director(outreq)
