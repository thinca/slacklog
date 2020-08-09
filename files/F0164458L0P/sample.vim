function! P(v, ...) abort
  if a:0
    echomsg a:1(a:v)
  else
    echomsg a:v
  endif
  return a:v
endfunction

let x = range(1, 10)
\ ->map({_, v -> v * 2})
\ ->P({v -> '1. ' .. string(v)})
\ ->filter({_, v -> v % 3 == 0})
\ ->P({v -> '2. ' .. string(v)})

echo x
