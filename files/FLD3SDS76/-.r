hook_add = '''
    nnoremap <silent> <C-p>      :<C-u>Denite file/rec -start-filter -vertical-preview <CR>
    nnoremap <silent> <C-f>      :<C-u>Denite grep -vertical-preview <CR>
    nnoremap <silent> <C-m>      :<C-u>Denite file_mru -vertical-preview <CR>
    nnoremap <silent> <C-b>      :<C-u>Denite buffer -vertical-preview <CR>
    nnoremap <silent> <C-y>      :<C-u>Denite neoyank -vertical-preview <CR>

    nnoremap <silent> <C-u>r     :<C-u>Denite -resume -vertical-preview <CR>
    nnoremap <silent> <C-u><C-r> :<C-u>Denite -resume -vertical-preview <CR>
    nnoremap <silent> <C-u>l     :<C-u>Denite -resume -immediately -select=+1 <CR>
    nnoremap <silent> <C-u><C-l> :<C-u>Denite -resume -immediately -select=+1 <CR>
    nnoremap <silent> <C-u>h     :<C-u>Denite -resume -immediately -select=-1 <CR>
    nnoremap <silent> <C-u><C-h> :<C-u>Denite -resume -immediately -select=-1 <CR>

    autocmd FileType denite call s:denite_my_settings()
    function! s:denite_my_settings() abort
      nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
      nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
      nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
      nnoremap <silent><buffer><expr> q denite#do_map('quit')
      nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
      nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
    endfunction
    autocmd FileType denite-filter call s:denite_filter_my_settings()
    function! s:denite_filter_my_settings() abort
      imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
    endfunction
    let s:denite_win_width_percent = 0.48
    let s:denite_win_margin_left_percent = 0.01
    let s:denite_win_height_percent = 0.8

    " Change denite default options
    call denite#custom#option('default', {
        \ 'split': 'floating',
        \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
        \ 'wincol': float2nr(&columns * s:denite_win_margin_left_percent),
        \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
        \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
        \ })
'''