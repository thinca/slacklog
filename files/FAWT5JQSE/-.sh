let s:err       = '%f(%l\,%c):\ %m'
let s:blank     = '%-G %.%#'
let s:invalid01 = '%-G[%.%#'
let s:invalid02 = '%-Gnamespace%.%#'
autocmd FileType fsharp let &errorformat = s:err . ',' . s:blank . ',' . s:invalid01 . ',' . s:invalid02