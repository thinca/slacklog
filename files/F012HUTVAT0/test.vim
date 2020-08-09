scriptencoding utf-8

augroup test
  autocmd BufReadCmd test://* call s:Open(expand('<amatch>'))
augroup END

function! s:Open(url)
  return 1
endfunction