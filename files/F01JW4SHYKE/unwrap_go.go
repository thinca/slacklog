for unwrapped := errors.Unwrap(err); unwrapped != nil ; unwrapped = errors.Unwrap(unwrapped) {
    //... work with `unwrapped`
}