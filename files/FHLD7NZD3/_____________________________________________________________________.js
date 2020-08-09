command! TrimEnd call s:trimEnd()
function! s:trimEnd() abort "{{{

    " mark origin position
    :normal! ma

    let l:range = '%'

    let l:unicodeSpaces = '\v
      \   %u180E|%u2028|%u2029|%u00A0|%u2000|%u2001
      \  |%u2002|%u2003|%u2004|%u2005|%u2006|%u2007
      \  |%u2008|%u2009|%u200A|%u202F|%u205F|%u3000'

    " Replace unicode spaces to normal space
    :execute l:range 'substitute' '/\v\(' . l:unicodeSpaces . '\)+$//ge'
    " back to origin position
    :normal! `a

  endfunction "}}}
