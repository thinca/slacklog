scriptencoding utf-8

function! s:on_lsp_buffer_enabled() abort
  "setlocal omnifunc=lsp#complete
  "setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END