" need quickrun

let buffer_name = 'vimrc-reading://next/a'
echomsg buffer_name
execute 'badd ' . buffer_name

if exists('+shellslash')
  let backup_shellslash = &shellslash
  set shellslash
endif
let buffer_name = 'vimrc-reading://next/b'
echomsg buffer_name
execute 'badd ' . buffer_name
if exists('backup_shellslash')
  let &shellslash = backup_shellslash
endif

if exists('+shellslash')
  let backup_shellslash = &shellslash
  set noshellslash
endif
let buffer_name = 'vimrc-reading://next/c'
echomsg buffer_name
execute 'badd ' . buffer_name
if exists('backup_shellslash')
  let &shellslash = backup_shellslash
endif

---

vimrc-reading://next/a
vimrc-reading://next/b
vimrc-reading://next/c


  2 %a + "[無名]"                       行 1
  3      "vimrc-reading:\next\a"        行 1
  4      "vimrc-reading:\next\b"        行 1
  5      "vimrc-reading:\next\c"        行 1
  6 #h   "split"                        行 1
