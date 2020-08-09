function! s:hoge() abort
  let cl = getcmdline()
  function! s:sink(line) abort closure
    call feedkeys(":" .. cl .. a:line, "n")
  endfunction
  function! s:run(...) abort closure
    call fzf#run({'source': 'ls -1', 'sink': funcref("s:sink")})
  endfunction
  call timer_start(0, funcref("s:run"))
  redraw
  return "\<C-c>"
endfunction

cnoremap <expr> <Tab> <SID>hoge()