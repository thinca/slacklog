function! s:popup_select(rawchar, ...) abort " {{{
  let result = ''
  call s:plugin_status_update()
  if g:user.plugin.asyncomplete
    let result = result . asyncomplete#close_popup()
    if a:0
      let result = result . a:1
    endif
  else
    let result = result . a:rawchar
  endif
  return result
endfunction " }}}

function! s:popup_cancel(rawchar, ...) abort " {{{
  let result = ''
  call s:plugin_status_update()
  if g:user.plugin.asyncomplete
    let result = result . asyncomplete#cancel_popup()
    if a:0
      let result = result . a:1
    endif
  else
    let result = result . a:rawchar
  endif
  return result
endfunction " }}}

function! s:insert_char(rawchar, charname) abort " {{{
  let result = ''
  call s:plugin_status_update()
  if g:user.plugin.lexima
    let result = result . lexima#expand(a:charname, 'i')
  else
    let result = result . a:rawchar
  endif
  return result
endfunction " }}}

function! s:imap_setup() abort " {{{
  inoremap <expr><silent> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr><silent> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr><silent> <CR>
    \ pumvisible() ? <SID>popup_select("\<C-y>"            ) : <SID>insert_char("\<CR>",    '<' . 'CR'    . '>')
  inoremap <expr><silent> <Space>
    \ pumvisible() ? <SID>popup_cancel("\<C-e>", "\<Space>") : <SID>insert_char("\<Space>", '<' . 'Space' . '>')
  inoremap <expr><silent> <C-y>
    \ pumvisible() ? <SID>popup_select("\<C-y>"            ) : "\<C-y>"
  inoremap <expr><silent> <C-e>
    \ pumvisible() ? <SID>popup_cancel("\<C-e>"            ) : "\<C-e>"
endfunction " }}}
autocmd MyAutoGroup VimEnter * nested call s:imap_setup()
