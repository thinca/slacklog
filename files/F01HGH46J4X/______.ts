  const providers = Array.from(languages.referenceManager.providers)
  let locations = []
  for (const { provider } of providers) {
    locations = [
      ...locations,
      ...(await provider.provideReferences(
        document,
        position,
        {
          includeDeclaration: false,
        },
        tokenSource.token
      )),
    ]
  }
