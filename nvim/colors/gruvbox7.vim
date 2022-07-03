" Name:         Gruvbox 8(Edited)
" Description:  Retro groove color scheme originally designed by morhetz
" Author:       morhetz <morhetz@gmail.com>
" Maintainer:   Lifepillar <lifepillar@lifepillar.me>
" Website:      https://github.com/lifepillar/vim-gruvbox8/
" License:      Vim License (see `:help license`)
" Last Updated: Tue Jun 11 20:40:51 2019

" Generated by Colortemplate v2.0.0b3

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'gruvbox7'

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2

if s:t_Co >= 256
  hi Normal ctermfg=252 ctermbg=NONE cterm=NONE
  hi FoldColumn ctermfg=102 ctermbg=NONE cterm=NONE
  hi SignColumn ctermfg=252 ctermbg=NONE cterm=NONE
  hi VertSplit ctermfg=59 ctermbg=NONE cterm=NONE
  hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE
  hi Conceal ctermfg=109 ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
  hi! link lCursor Cursor
  hi! link iCursor Cursor
  hi! link vCursor Cursor
  hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE
  hi! link CursorColumn CursorLine
  hi CursorLineNr ctermfg=214 ctermbg=NONE cterm=NONE

  hi DiffAdd ctermfg=142 ctermbg=235 cterm=reverse
  hi DiffChange ctermfg=107 ctermbg=235 cterm=reverse
  hi DiffDelete ctermfg=203 ctermbg=235 cterm=reverse
  hi DiffText ctermfg=214 ctermbg=235 cterm=reverse

  hi GitSignsAdd ctermfg=142 ctermbg=NONE cterm=NONE
  hi! link GitSignsAddNr DiffAdd
  hi GitSignsChange ctermfg=107 ctermbg=NONE cterm=NONE
  hi! link GitSignsChangeNr DiffChange
  hi GitSignsDelete ctermfg=203 ctermbg=NONE cterm=NONE
  hi! link GitSignsDeleteNr DiffDelete

  hi Directory ctermfg=142 ctermbg=NONE cterm=bold
  hi EndOfBuffer ctermfg=235 ctermbg=NONE cterm=NONE
  hi Error ctermfg=203 ctermbg=235 cterm=bold,reverse
  hi ErrorMsg ctermfg=235 ctermbg=203 cterm=bold
  hi Folded ctermfg=102 ctermbg=237 cterm=NONE
  hi IncSearch ctermfg=208 ctermbg=235 cterm=reverse
  hi! link HighlightedyankRegion IncSearch
  hi LineNr ctermfg=243 ctermbg=NONE cterm=NONE
  hi MatchParen ctermfg=NONE ctermbg=59 cterm=bold
  hi ModeMsg ctermfg=214 ctermbg=NONE cterm=bold
  hi MoreMsg ctermfg=214 ctermbg=NONE cterm=bold
  hi NonText ctermfg=239 ctermbg=NONE cterm=NONE

  hi Pmenu ctermfg=252 ctermbg=236 cterm=NONE
  hi PmenuSbar ctermfg=NONE ctermbg=239 cterm=NONE
  hi PmenuSel ctermfg=239 ctermbg=109 cterm=bold
  hi PmenuThumb ctermfg=NONE ctermbg=243 cterm=NONE

  hi Question ctermfg=208 ctermbg=NONE cterm=bold
  hi Search ctermfg=214 ctermbg=235 cterm=reverse
  hi! link QuickFixLine Search
  hi SpecialKey ctermfg=239 ctermbg=NONE cterm=NONE

  hi SpellBad ctermfg=203 ctermbg=NONE cterm=NONE,underline
  hi SpellCap ctermfg=109 ctermbg=NONE cterm=NONE,underline
  hi SpellLocal ctermfg=107 ctermbg=NONE cterm=NONE,underline
  hi SpellRare ctermfg=175 ctermbg=NONE cterm=NONE,underline

  hi StatusLine ctermfg=239 ctermbg=252 cterm=reverse
  hi! link StatusLineTerm StatusLine
  hi StatusLineNC ctermfg=237 ctermbg=137 cterm=reverse
  hi! link StatusLineTermNC StatusLineNC
  hi TabLine ctermfg=243 ctermbg=NONE cterm=NONE
  hi TabLineFill ctermfg=243 ctermbg=NONE cterm=NONE
  hi TabLineSel ctermfg=142 ctermbg=237 cterm=NONE
  hi Title ctermfg=142 ctermbg=NONE cterm=bold
  hi Visual ctermfg=NONE ctermbg=59 cterm=NONE
  hi! link VisualNOS Visual
  hi WarningMsg ctermfg=203 ctermbg=NONE cterm=bold
  hi WildMenu ctermfg=109 ctermbg=239 cterm=bold

  hi Boolean ctermfg=175 ctermbg=NONE cterm=NONE
  hi Character ctermfg=175 ctermbg=NONE cterm=NONE
  hi Comment ctermfg=102 ctermbg=NONE cterm=italic
  hi Conditional ctermfg=203 ctermbg=NONE cterm=NONE
  hi Constant ctermfg=175 ctermbg=NONE cterm=NONE
  hi Define ctermfg=107 ctermbg=NONE cterm=NONE
  hi Debug ctermfg=203 ctermbg=NONE cterm=NONE
  hi Delimiter ctermfg=208 ctermbg=NONE cterm=NONE
  hi Error ctermfg=203 ctermbg=235 cterm=bold,reverse
  hi Exception ctermfg=203 ctermbg=NONE cterm=bold
  hi Float ctermfg=175 ctermbg=NONE cterm=NONE
  hi Function ctermfg=142 ctermbg=NONE cterm=bold
  hi Structure ctermfg=107 ctermbg=NONE cterm=NONE
  hi Include ctermfg=107 ctermbg=NONE cterm=NONE
  hi PreProc ctermfg=107 ctermbg=NONE cterm=NONE
  hi Number ctermfg=175 ctermbg=NONE cterm=NONE
  hi Operator ctermfg=107 ctermbg=NONE cterm=NONE
  hi Keyword ctermfg=203 ctermbg=NONE cterm=NONE
  hi String ctermfg=142 ctermbg=NONE cterm=NONE

  hi Identifier ctermfg=109 ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=fg ctermbg=NONE cterm=NONE
  hi Label ctermfg=203 ctermbg=NONE cterm=NONE
  hi Macro ctermfg=107 ctermbg=NONE cterm=NONE
  hi PreCondit ctermfg=107 ctermbg=NONE cterm=NONE
  hi Repeat ctermfg=203 ctermbg=NONE cterm=NONE

  hi SpecialChar ctermfg=203 ctermbg=NONE cterm=NONE
  hi SpecialComment ctermfg=203 ctermbg=NONE cterm=NONE
  hi Statement ctermfg=203 ctermbg=NONE cterm=NONE
  hi StorageClass ctermfg=208 ctermbg=NONE cterm=NONE
  hi Special ctermfg=208 ctermbg=NONE cterm=NONE
  hi! link Tag Special
  hi Todo ctermfg=fg ctermbg=235 cterm=bold,NONE
  hi Type ctermfg=214 ctermbg=NONE cterm=NONE
  hi Typedef ctermfg=214 ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=109 ctermbg=NONE cterm=underline
  hi CursorIM ctermfg=NONE ctermbg=NONE cterm=reverse
  hi ToolbarLine ctermfg=NONE ctermbg=59 cterm=NONE
  hi ToolbarButton ctermfg=230 ctermbg=59 cterm=bold
  hi Warnings ctermfg=208 ctermbg=235 cterm=reverse

  hi NormalMode ctermfg=137 ctermbg=235 cterm=reverse
  hi InsertMode ctermfg=109 ctermbg=235 cterm=reverse
  hi ReplaceMode ctermfg=107 ctermbg=235 cterm=reverse
  hi VisualMode ctermfg=208 ctermbg=235 cterm=reverse
  hi CommandMode ctermfg=175 ctermbg=235 cterm=reverse

  hi LspReferenceText ctermfg=NONE ctermbg=240 cterm=NONE
  hi LspReferenceRead ctermfg=NONE ctermbg=240 cterm=NONE
  hi LspReferenceWrite ctermfg=NONE ctermbg=240 cterm=NONE

  if has('nvim')
    hi! link TermCursor Cursor
    hi TermCursorNC ctermfg=237 ctermbg=252 cterm=NONE
  endif
endif