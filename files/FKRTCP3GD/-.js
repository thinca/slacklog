scriptencoding utf-8

function s:get_rainfall(timer) abort
  let l:job = job_start(
        \ ['curl', 'https://tenki.jp/amedas/3/17/46106.html'],
        \ {'out_cb', function('s:show_rainfall')})
endfunction

function s:show_rainfall(ch, msg) abort
  call popup_create('rain', {'time': 1000, 'border': []})
endfunction

let timer = timer_start(2000, function('s:get_rainfall'), {'repeat': -1})