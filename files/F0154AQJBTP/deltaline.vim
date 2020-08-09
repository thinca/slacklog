function! deltaLine#main() abort
	set relativenumber!
	augroup deltaLine
		autocmd!
		autocmd CursorMoved * ++once set relativenumber!
	augroup END
endfunction