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

" It seems, this resolves comment un-indent issues
filetype plugin indent on
syntax enable

if &t_Co > 2 || has("gui_running")
  syntax on
endif

if has("gui_running")
  colorscheme aswna256
  if $OSTYPE==#"linux"
    set guifont=DejaVu\ Sans\ Mono\ 10
  elseif $OS==#"Windows_NT"
    set guifont=Consolas:h11:cANSI
  endif
else
  if $TERM==#"vt100"
    set t_Co=8
    colorscheme aswna
  elseif $TERM=~"-256color"
    set t_Co=256
    colorscheme aswna256
  else
    colorscheme aswna
  endif
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
