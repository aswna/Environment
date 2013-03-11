" Precede each line with its line number.
set number

" Show (partial) command in the last line of the screen.
set showcmd

" Lines will not wrap and only part of long lines will be displayed.
set nowrap
set whichwrap+=b,s,<,>

" When set, the screen contents is restored when exiting Vim.  This also
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

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
  set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:·
endif
set list

" It seems, this resolves comment un-indent issues
filetype plugin indent on
syntax enable

if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Colorscheme
set background=dark
let g:solarized_contrast="high"
let g:solarized_diffmode="high"
colorscheme solarized

" GUI font setting
if $OSTYPE==#"linux"
  set guifont=DejaVu\ Sans\ Mono\ 10
elseif $OS==#"Windows_NT"
  set guifont=Consolas:h11:cANSI
endif

" Last window will have a status line always.
set laststatus=2

" Set status line fg color to white and bg color to  none,
" independent from the current color scheme
hi StatusLine ctermfg=white ctermbg=none
au InsertEnter * hi StatusLine ctermbg=1
au InsertLeave * hi StatusLine ctermfg=white ctermbg=none

" Maximum number of tab pages to be opened by the '-p' command line argument.
set tabpagemax=20

" The line with tab page labels will be always displayed.
set showtabline=2
if has("gui_running")
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
  set statusline=%<%t\ %h%w%m%r%y\ [%{&ff}]%=C:%c%V\ L:%l/%L\ (%p%%)\ B:%o
else
  hi def link User1 Tabline
  hi def link User2 TablineSel
  augroup SetStatusLineAtEnteringBufferForTextMode
    au!
    autocmd BufEnter * set statusline=%!MyTextModeStatusLine()
  augroup END
  set tabline=%!MyTextModeTabLine()
endif
