function! Sleep(ms) abort
  let match_cursor_id = matchadd('ErrorMsg', '\%#', 101)
  redraw
  let t = reltime()
  while !getchar(1) && a:ms - str2float(reltimestr(reltime(t))) * 1000.0 > 0
  endwhile
  call matchdelete(match_cursor_id)
endfunction

nnoremap <silent> <Plug>(sleep) :<C-u>call Sleep(800)<CR>
nnoremap <silent> <Plug>(n) n
nmap n <Plug>(n)<Plug>(sleep)
" nnoremap n n:<C-u>call Sleep(800)<CR>

colorscheme desert
set hlsearch cursorline

