function! s:ToggleCase()
    let cur_word = expand("<cword>")
    if cur_word == ''
        return
    endif

    let new_word = ''
    if toupper(cur_word)==#cur_word  " CONST_ISH
        let new_word = tolower(cur_word)
    elseif cur_word =~ '_'  " snake_case
        let chunks = split(cur_word, '_')
        let new_word = tolower(chunks[0])
        for chunk in chunks[1:]
            let chunk = tolower(chunk)
            let chunk = substitute(chunk, '^.', '\U\0', '')
            let new_word = new_word . chunk
        endfor
    else  " camelCase...maybe
        let chunks = split(cur_word, '[^A-Z]\zs\ze[A-Z]', 1)
        let new_word = toupper(chunks[0])
        for chunk in chunks[1:]
            let chunk = toupper(chunk)
            let new_word = new_word . '_' . chunk
        endfor
    endif
    execute 'normal viwc' . new_word . ''
    execute 'normal b'
endfunction
command! ToggleCase call <SID>ToggleCase()
nnoremap <C-n> :<C-u>ToggleCase<CR>