command! -buffer Vimrc  : call Vimrc()
function Vimrc ()
    :vsp
    :e /Users/callmekohei/.config/nvim/init.vim
endfunction