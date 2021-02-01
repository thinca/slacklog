augroup vimrc_init_core
  autocmd VimEnter,BufWinEnter,WinEnter * nested
        \ setlocal cursorline cursorcolumn
  autocmd WinLeave                      * nested
        \ setlocal nocursorline nocursorcolumn
  " based on https://postd.cc/vim-galore-4/
  " edit off
  " if cursorlineopt support: Enter only show number/Leave show both
  if exists('+cursorlineopt')
    autocmd InsertEnter * nested setlocal cursorlineopt=number
    autocmd InsertLeave * nested setlocal cursorlineopt=both
  else
    autocmd InsertEnter * nested setlocal nocursorline
    autocmd InsertLeave * nested setlocal cursorline
  endif
  autocmd InsertEnter * nested setlocal nocursorcolumn
  autocmd InsertLeave * nested setlocal cursorcolumn
augroup END
