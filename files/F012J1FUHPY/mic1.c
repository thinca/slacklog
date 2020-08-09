/*
 * Check if "fname" starts with "name://".  Return URL_SLASH if it does.
 * Return URL_BACKSLASH for "name:\\".
 * Return zero otherwise.
 */
    int
path_with_url(char_u *fname)
{
    char_u *p;

    for (p = fname; isalpha(*p); ++p)
		;
    return path_is_url(p);
}