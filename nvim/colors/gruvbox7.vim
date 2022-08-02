" Name:         Gruvbox 7
" Description:  Retro groove color scheme originally designed by morhetz.
"
" Author:       morhetz <morhetz@gmail.com>
" Original:     https://github.com/morhetz/gruvbox
"
" Author:       Lifepillar <lifepillar@lifepillar.me>
" Gruvbox8:     https://github.com/lifepillar/vim-gruvbox8

if exists('g:colors_name')
    hi clear
    if exists('syntax_on')
        syntax reset
    endif
endif

let g:colors_name = 'gruvbox7'

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2

if s:t_Co >= 256
    lua require('gruvbox7')
endif
