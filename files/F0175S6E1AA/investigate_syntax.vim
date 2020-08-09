" vim:set ts=8 sts=2 sw=2 tw=0 et:

function! s:investigate_syntax()
  let l:synstack = reverse(synstack(line("."), col(".")))
  if l:synstack->len() == 0
    echo "(NONE)"
    return
  endif
  let l:num = 0
  let l:msg = ""
  for id in l:synstack
    if l:num > 0
      let l:msg ..= " "
    endif
    let l:num += 1
    let l:msg ..= printf("%d:%s", l:num, id->synIDattr("name"))
    let l:id2 = id->synIDtrans()
    if l:id2 == id
      continue
    endif
    while l:id2 != id
      let l:msg ..= "->" .. l:id2->synIDattr("name")
      let id = l:id2
      let l:id2 = id->synIDtrans()
    endwhile
  endfor
  echo l:msg
endfunction

nnoremap <F12> :call <SID>investigate_syntax()<CR>