" Precede each line with its line number.
set number

" Show (partial) command in the last line of the screen.
set showcmd

" Lines will not wrap and only part of long lines will be displayed.
set nowrap
set whichwrap+=b,s,<,>

" When set, the screen contents is restored when exiting Vim. This also
" happens when executing external commands.
set restorescreen

" Try to move the cursor to the first non-blank of the line.
set nostartofline

" When on, splitting a window will put the new window below the current one.
set splitbelow

" To show the end of changed word
set cpoptions+=$

" draw a nice margin (colorcolumn is available since 7.3),
" unfortunately it wraps the text (?)
set textwidth=99
set formatoptions-=t
set formatoptions+=c
set formatoptions-=r
set formatoptions-=o
set formatoptions-=a
set formatoptions-=v
set formatoptions-=b
set formatoptions-=l
set formatoptions-=m
set formatoptions-=M
set formatoptions-=B
set formatoptions+=1
set colorcolumn=+1

" When 'wildmenu' is on, command-line completion operates in an enhanced mode.
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:·
set list

" It seems, this resolves comment un-indent issues
filetype plugin indent on
syntax enable
syntax on

" Colorscheme
set background=dark
colorscheme solarized
" For Syntastic with Solarized
highlight! link SignColumn Error

" GUI font setting
if $OSTYPE==#"linux"
  set guifont=DejaVu\ Sans\ Mono\ 10
elseif $OS==#"Windows_NT"
  set guifont=Consolas:h11:cANSI
endif

" Last window will have a status line always.
set laststatus=2

" Maximum number of tab pages to be opened by the '-p' command line argument.
set tabpagemax=20

" The line with tab page labels will be always displayed.
set showtabline=2

set statusline=%!MyStatusLine()

if has("gui_running")
  set guioptions-=L " remove left-hand scrollbar in vertically split window
  set guioptions-=l " remove left-hand scrollbar
  set guioptions-=R " remove right-hand scrollbar in vertically split window
  set guioptions-=r " remove right-hand scrollbar
  set guioptions-=b " remove bottom (horizontal) scrollbar
  set guioptions-=m " remove menu bar
  set guioptions-=T " remove tool bar

  set guitablabel=%{GuiTabLabel()}
  set guitabtooltip=%{GuiTabToolTip()}
  augroup SetTitleStringAtEnteringBufferForGUI
    au!
    if empty(expand($CCVIEW))
      autocmd BufEnter * let &titlestring = expand("%:t")
    else
      autocmd BufEnter * let &titlestring = "[" . expand($CCVIEW) . "] " . expand("%:t")
    endif
  augroup END
else
  highlight def link User1 Tabline
  highlight def link User2 TablineSel
  set tabline=%!MyTextModeTabLine()
endif
