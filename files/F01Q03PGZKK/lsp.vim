function! s:on_lsp_buffer_enabled_go() abort
  if &filetype ==# 'go'
    autocmd BufWritePre <buffer> silent LspDocumentFormatSync
    autocmd BufWritepre <buffer> silent LspCodeActionSync source.organizeImports
  endif
endfunction

augroup vimrc
  au User lsp_buffer_enabled call s:on_lsp_buffer_enabled_go()
augroup END
