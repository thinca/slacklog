set encoding=utf-8
scriptencoding utf-8

set rtp+=$HOME/.cache/dein/repos/github.com/thinca/vim-quickrun_new-buffer-outputter

let s:quickrun_config = {}
let s:quickrun_config['_'] = {}
let s:quickrun_config['_']['outputter'] = 'buffer'
let s:quickrun_config['_']['outputter/buffer/opener'] = ':rightbelow 8sp'
let s:quickrun_config['_']['outputter/buffer/close_on_empty'] = 1

let g:quickrun_config = extend(s:quickrun_config, get(g:, 'quickrun_config', {}), "keep")

filetype plugin indent on
syntax on
