" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file based on koehler

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "aswna"

"0  Black
"1  DarkBlue
"2  DarkGreen
"3  DarkCyan
"4  DarkRed
"5  DarkMagenta
"6  Brown, DarkYellow
"7  LightGray, LightGrey, Gray, Grey
"8  DarkGray, DarkGrey
"9  Blue, LightBlue
"10 Green, LightGreen
"11 Cyan, LightCyan
"12 Red, LightRed
"13 Magenta, LightMagenta
"14 Yellow, LightYellow
"15 White

"hi ColorColumn
"hi Conceal
"hi Cursor
hi CursorColumn   cterm=underline
"hi CursorIM
hi CursorLine     cterm=underline
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
hi Directory      cterm=bold      ctermfg=brown
hi ErrorMsg       cterm=bold      ctermfg=grey        ctermbg=red
"hi FoldColumn
"hi Folded
hi LineNr         cterm=bold      ctermfg=DarkGrey
hi MatchParen                     ctermfg=blue
hi ModeMsg        cterm=bold
hi MoreMsg        cterm=bold      ctermfg=darkgreen
hi NonText        cterm=bold      ctermfg=darkred
"hi Normal
hi Pmenu                                              ctermbg=Brown
"hi PmenuSbar
hi PmenuSel                                           ctermbg=DarkGrey
"hi PmenuThumb
hi Question       cterm=bold      ctermfg=darkgreen
hi Search                         ctermfg=white       ctermbg=red
"hi SignColumn
hi SpecialKey     cterm=bold      ctermfg=darkred
hi SpellBad                       ctermfg=LightRed    ctermbg=DarkGrey
"hi SpellCap
"hi SpellLocal
"hi SpellRare
hi StatusLine     cterm=bold      ctermfg=lightblue   ctermbg=white
hi StatusLineNC                   ctermfg=white       ctermbg=lightblue
hi TabLine        cterm=bold      ctermfg=lightblue   ctermbg=white
hi TabLineFill    cterm=bold      ctermfg=lightblue   ctermbg=white
hi TabLineSel                     ctermfg=white       ctermbg=lightblue
hi Title          cterm=bold      ctermfg=darkmagenta
"hi VertSplit
hi Visual         cterm=reverse
"hi VisualNOS
hi WarningMsg     cterm=bold      ctermfg=darkred
"hi WildMenu
hi Comment        cterm=bold      ctermfg=DarkGrey
hi Constant       cterm=bold      ctermfg=magenta
hi Error                          ctermfg=darkcyan    ctermbg=black
hi Identifier                     ctermfg=brown
"hi Ignore
hi PreProc                        ctermfg=darkmagenta
hi Special        cterm=bold      ctermfg=red
hi Statement      cterm=bold      ctermfg=yellow
hi Todo                           ctermfg=Blue        ctermbg=Yellow
hi Type           cterm=bold      ctermfg=lightgreen
"hi Underlined

hi link Boolean        Constant
hi link Character      Constant
hi link Conditional    Statement
hi link Debug          Special
hi link Define         PreProc
hi link Delimiter      Special
hi link Exception      Statement
hi link Float          Number
hi link Function       Identifier
hi link IncSearch      Visual
hi link Include        PreProc
hi link Keyword        Statement
hi link Label          Statement
hi link Macro          PreProc
hi link Number         Constant
hi link Operator       Statement
hi link PreCondit      PreProc
hi link Repeat         Statement
hi link SpecialChar    Special
hi link SpecialComment Special
hi link StorageClass   Type
hi link String         Constant
hi link Structure      Type
hi link Tag            Special
hi link Typedef        Type
