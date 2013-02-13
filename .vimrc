" This .vimrc file is not compatible with older vim versions.
" At the moment at least 7.3 is required.

" See http://vimdoc.sourceforge.net/htmldoc/options.html#'nocompatible'
" Make Vim behave in a more useful way.
set nocompatible

let myscriptsfile="$HOME/.vim/scripts.vim"
let spellfile="$HOME/.vim/spellfile.add"

" Remove all abbreviations for Command-line mode
cabclear

" for PuTTY (or screen?)
if $TERM==#"vt100" || $TERM==#"xterm-256color"
  set <Up>=[A
  noremap <Up> [A
  set <Down>=[B
  noremap <Down> [B
  set <Right>=[C
  noremap <Rigth> [C
  set <Left>=[D
  noremap <Left> [D
  " Cannot be mapped in vim (?)
  "set <C-Up>=OA
  "noremap <C-Up> OA
  "set <C-Down>=OB
  "noremap <C-Down> OB
  set <C-Right>=OC
  noremap <C-Right> OC
  set <C-Left>=OD
  noremap <C-Left> OD
  set <Insert>=[2~
  noremap <Insert> [2~
  set <Delete>=[3~
  noremap <Delete> [3~
  set <Home>=[1~
  noremap <Home> [1~
  set <End>=[4~
  noremap <End> [4~
  set <PageUp>=[5~
  noremap <PageUp> [5~
  set <PageDown>=[6~
  noremap <PageDown> [6~
endif

if $TERM==#"vt100"
  set <F1>=OP
  noremap <F1> OP
  set <F2>=OQ
  noremap <F2> OQ
  set <F3>=OR
  noremap <F3> OR
  set <F4>=OS
  noremap <F4> OS
  set <F5>=[15~
  noremap <F5> [15~
  set <F6>=[17~
  noremap <F6> [17~
  set <F7>=[18~
  noremap <F7> [18~
  set <F8>=[19~
  noremap <F8> [19~
  set <F9>=[20~
  noremap <F9> [20~
  set <F10>=[10~
  noremap <F10> [10~
  set <F11>=[23~
  noremap <F11> [23~
  set <F12>=[24~
  noremap <F12> [24~
endif

if $TERM==#"xterm-256color"
  set <F1>=[11~
  noremap <F1> [11~
  set <F2>=[12~
  noremap <F2> [12~
  set <F3>=[13~
  noremap <F3> [13~
  set <F4>=[14~
  noremap <F4> [14~
  set <F5>=[15~
  noremap <F5> [15~
  set <F6>=[17~
  noremap <F6> [17~
  set <F7>=[18~
  noremap <F7> [18~
  set <F8>=[19~
  noremap <F8> [19~
  set <F9>=[20~
  noremap <F9> [20~
  set <F10>=[21~
  noremap <F10> [21~
  set <F11>=[23~
  noremap <F11> [23~
  set <F12>=[24~
  noremap <F12> [24~
endif

" Ctrl-Left / Ctrl-Right: go to the previous / next tab
nnoremap <silent> <C-Left>  :tabprevious<CR>
nnoremap <silent> <C-Right> :tabnext<CR>

if $TERM==#"vt100" || $TERM==#"xterm-256color"
  " Ctrl-Up / Ctrl-Down: move the current tab to the left / right
  nnoremap <silent> OA :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
  nnoremap <silent> OB :execute 'silent! tabmove ' . tabpagenr()<CR>
endif

"let &t_Co=8
" Set foreground and background colors (might be needed for Solaris 8/9?)
"if has("terminfo")
"  let &t_Sf="\e[3%p1%dm"
"  let &t_Sb="\e[4%p1%dm"
"else
"  let &t_Sf="\e[3%dm"
"  let &t_Sb="\e[4%dm"
"endif

" See http://vimdoc.sourceforge.net/htmldoc/options.html#'backspace'
" allow backspacing over autoindent, over line breaks (join lines), over the
" start of insert
set backspace=indent,eol,start

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2
" Number of spaces that a <Tab> counts for while performing editing.
set softtabstop=2
" Number of spaces to use for each step of (auto)indent.
set shiftwidth=2
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set expandtab

" Maximum number of tab pages to be opened by the '-p' command line argument.
set tabpagemax=20

" Copy indent from current line when starting a new line.
set autoindent
" Do smart autoindenting when starting a new line.
set smartindent
"set cindent
set cino=g2,h2,i0

" While typing a search command, show where the pattern, as it was typed
" so far, matches.
set incsearch
" Override the 'ignorecase' option if the search pattern contains upper
" case characters.
set smartcase
" Ignore case in search patterns.  Also used when searching in the tags file.
set ignorecase

" Precede each line with its line number.
set number
" When there is a previous search pattern, highlight all its matches.
set hlsearch

" PERSISTENCY --->
" Number of command-lines to be remembered.
set history=1000

" Write the contents of the file, if it has been modified, in case of several
" commands, buffer changes.
set autowriteall

let s:my_tmp_dir = $HOME . "/tmp"
let s:my_tmp_vim_dir = s:my_tmp_dir . "/vim"
let s:my_tmp_vim_ccview_dir = s:my_tmp_vim_dir . "/" . $CCVIEW
if !isdirectory(s:my_tmp_vim_ccview_dir)
  call mkdir(s:my_tmp_vim_ccview_dir, "p")
endif

" For Unix and Win32, if a directory ends in two path separators "//"
" or "\\", the swap file name will be built from the complete path
" to the file with all path separators substituted to percent '%' signs.
" This will ensure file name uniqueness in the preserve directory.
let s:base_backup_directory=s:my_tmp_vim_dir . "//"
let s:base_backup_directory=s:base_backup_directory . "," . s:my_tmp_dir . "//"
let s:base_backup_directory=s:base_backup_directory . "," . "/var/tmp"   . "//"
let s:base_backup_directory=s:base_backup_directory . "," . "/tmp"       . "//"

" Where to put swap files and where to find them.
let &directory=s:my_tmp_vim_ccview_dir . "//," . s:base_backup_directory

" List of directories for the backup file, separated with commas.
let &backupdir=&directory

" Create backups.
set backup

if has("persistent_undo")
    let &undodir=&directory
    set undofile
else
   " Do not unload buffer, when abandoned
    set hidden
endif

augroup SetPersistencyDirAccordingToFileLocation
  au!
  autocmd BufEnter * call SetPersistencyDirs()

  function! SetPersistencyDirs()
    if (match(expand("%:p"), "^/vobs/") == 0)
      let &directory=s:my_tmp_vim_ccview_dir . "//," . s:base_backup_directory
    else
      let &directory=s:base_backup_directory
    endif
    let &backupdir=&directory
    if has("persistent_undo")
      let &undodir=&directory
    endif
  endfunction
augroup END
" PERSISTENCY ---|

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
"set cpoptions+=$

" draw a nice margin (colorcolumn is available since 7.3),
" unfortunately it wraps the text (?)
"set textwidth=79
"set formatoptions-=t
"set formatoptions+=c
"set formatoptions-=r
"set formatoptions-=o
"set formatoptions-=a
"set formatoptions-=v
"set formatoptions-=b
"set formatoptions-=l
"set formatoptions-=m
"set formatoptions-=M
"set formatoptions-=B
"set formatoptions+=1
"set colorcolumn=+1

set runtimepath=$HOME/.vim,$VIMRUNTIME,/usr/share/vim/vimfiles/after,$HOME/.vim/after

" OmniCppComplete -->
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 1
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,menuone,longest,preview
" OmniCppComplete --|

" TagList -->
let Tlist_Ctags_Cmd = "$HOME/bin/ctags"
let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Use_Horiz_Window = 1
" see also Tlist_WinWidth below
let Tlist_Display_Prototype = 1
"let Tlist_Compact_Format = 1
let Tlist_File_Fold_Auto_Close = 1
" TagList --|

" filename completion
set wildmode=longest:full
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
else
  " for PuTTY (or screen?)
  if $TERM==#"vt100"
    set t_Co=8
    colorscheme aswna
  elseif $TERM==#"xterm-256color"
    set t_Co=256
    colorscheme aswna256
  else
    colorscheme aswna
  endif
endif

" Last window will have a status line always.
set laststatus=2

" Highlighted status line (?)
hi StatusLine ctermfg=white ctermbg=none
au InsertEnter * hi StatusLine ctermbg=1
au InsertLeave * hi StatusLine ctermfg=white ctermbg=none

" Set up tab labels with buffer name, number of windows.
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)

  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor

  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name

  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  if wincount > 1
    return label . '  [' . wincount . ']'
  endif
  return label
endfunction

" Set up tab tooltips with every buffer name
function! GuiTabToolTip()
  let tip = ''
  let bufnrlist = tabpagebuflist(v:lnum)

  for bufnr in bufnrlist
    " separate buffer entries
    if tip!=''
      let tip .= ' | '
    endif

    " Add name of buffer
    let name=bufname(bufnr)
    if name == ''
      " give a name to no name documents
      if getbufvar(bufnr,'&buftype')=='quickfix'
        let name = '[Quickfix List]'
      else
        let name = '[No Name]'
      endif
    endif
    let tip.=name

    " add modified/modifiable flags
    if getbufvar(bufnr, "&modified")
      let tip .= ' [+]'
    endif
    if getbufvar(bufnr, "&modifiable")==0
      let tip .= ' [-]'
    endif
  endfor

  return tip
endfunction

" Determine tab label for text mode.
function! MyTextModeTabLabel(n, maxlength)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = bufname(buflist[winnr - 1])
  let tablabel = fnamemodify(name, ':t')
  let tablabel = strpart(tablabel, 0, a:maxlength)
  return tablabel
endfunction

" Create the whole tab line
function! MyTextModeInternalTabLine(maxlength)
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    "let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTextModeTabLabel()
    let s .= '%{MyTextModeTabLabel(' . (i + 1) . ',' . a:maxlength . ')}%#TabLineFill#|'
  endfor

  " after the last tab fill with TabLineFill and reset tab page number
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif
  "echo "len(s) = " . len(s)

  return s
endfunction

" See above why the length is calculated this way...
function! MyTextModeInternalTabLineLength(maxlength)
  let s = ""
  for i in range(tabpagenr('$'))
    let s = s . MyTextModeTabLabel(i+1, a:maxlength) . "|"
  endfor
  let len = strlen(s) + 1
  if tabpagenr('$') > 1
    let len += 1
  endif
  return len
endfunction

" Set up the tab line. Try to fill up the whole line as much as possible.
function! MyTextModeTabLine()
  " You might optimize this value for your needs
  let ABSOLUTE_MAXLENGTH = 64

  " The aim is to determine the optimal (max)length used as max tab label (title) length
  let tries = 0
  let maxlength = ABSOLUTE_MAXLENGTH
  let tablen = MyTextModeInternalTabLineLength(maxlength)
  while tablen > &columns
    let maxlength -= 1
    if maxlength < 1
      let maxlength = 1
    endif
    let tablen = MyTextModeInternalTabLineLength(maxlength)
    let tries += 1
    " Safty belt for infinite loop
    if tries > ABSOLUTE_MAXLENGTH - maxlength "TODO:+1?
      break
    endif
  endwhile
  "echo "The current window has " . &columns . " columns. Tabline length is " . tablen ", maxlength is " . maxlength

  " Use the above calculated length
  let s = MyTextModeInternalTabLine(maxlength)
  return s
endfunction

" A statusbar function, that provides a visual scrollbar (based on the courtesy of A. Politz)
func! MyTextModeStatusLine()
  " Setting window width for TagList dynamically
  let g:Tlist_WinWidth = &columns / 4

  let statusline = "%<" . expand("%:p") . "\ %h%w%m%r%y\ [%{&ff}]\ " . '[%{(&fenc==""?&enc:&fenc)}] ' . "%=C:%c%V\ L:%l/%L\ (%p%%)\ B:%o"
  let barWidth = 10 " &columns / 4 " / winnr("$")
  let barWidth = barWidth < 3 ? 3 : barWidth

  if line('$') > 1
    let progress = (line('.') - 1) * (barWidth - 1) / (line('$') - 1)
  else
    let progress = barWidth/2
  endif

  let bar = ' [%1*%' . barWidth . '.' . barWidth . '(' . repeat('-', progress) .'%2*|%1*' . repeat('-', barWidth - progress - 1) . '%0*%)%<]'

  return statusline.bar
endfun

" The line with tab page labels will be always displayed.
set showtabline=2
if has("gui_running")
  set guitablabel=%{GuiTabLabel()}
  set guitabtooltip=%{GuiTabToolTip()}
  augroup SetTitleStringAtEnteringBufferForGUI
    au!
    autocmd BufEnter * let &titlestring = "[" . expand($CCVIEW) . "] " . expand("%:t")
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

set tags=./tags,tags " add your tag files here

" SeeTabs / HideTabs -->
function! SeeTabs()
  set list
  set listchars=tab:>-
endfunc
command! -nargs=0 SeeTabs :call SeeTabs()

function! HideTabs()
  set nolist
  set listchars=eol:$
endfunc
command! -nargs=0 HideTabs :call HideTabs()
" SeeTabs / HideTabs --|

" Try to reset settings after vimdiff.
command! -nargs=0 Q q|diffoff|set nowrap
" Some "aliases".
command! -nargs=0 QA qa
command! -nargs=0 Qa qa
command! -nargs=0 WQA wqa
command! -nargs=0 WQa wqa
command! -nargs=0 Wqa wqa
command! -nargs=0 Wq wq
command! -nargs=0 W w

" Buffer-explorer settings -->
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDetailedHelp=1
let g:bufExplorerFindActive=1
let g:bufExplorerReverseSort=0
let g:bufExplorerShowDirectories=0
let g:bufExplorerShowRelativePath=0
let g:bufExplorerShowTabBuffer=0
let g:bufExplorerShowUnlisted=0
let g:bufExplorerSortBy='mru'
let g:bufExplorerSplitBelow=1
let g:bufExplorerSplitOutPathName=0
let g:bufExplorerSplitRight=1
" Buffer-explorer settings --|

" Map space to center on line
nmap <space> zz

" Centering the search on next / previous
"nmap n nzz
"nmap N Nzz

" Hitting 'Enter' breaks line
map  i

" Execute macro q
map <F1> @q

" Open new tab with the next file
map <silent> <F2> :tabnew<CR>:silent! n<CR>

" Using <F3> to toggle spellcheck in vim 7
inoremap <silent> <F3> <c -O>:set spell!<CR>
map <silent> <F3> :set spell!<CR>

" Using <F4> to toggle hlsearch
inoremap <silent> <F4> <c -O>:set hlsearch!<CR>
map <silent> <F4> :set hlsearch!<CR>

" Check-out file (ClearCase)
let g:ccaseNoComment=1 " do not ask for comment
map <F5> :silent! ctcou \| :redraw!<CR>

" Undo check-out file (ClearCase)
let g:ccaseAutoRemoveCheckout=1 " remove .keep file
map <F6> :silent! ctunco \| :redraw!<CR>

" \d: Diff to previous verion (ClearCase).
nmap <silent> <Leader>d :Ctpdif<CR>

" \t: Switch to test code file from production source code file (or vice versa).
" Switch from ../src/.../Thing.cc to ../bt_src/.../TestThing.cc (or vice versa).
" TODO: refactor to a function?
map <Leader>t :e %:p:s,\(.*\)/src/\(.*\)/\(.*\).cc$,\1/xxxxxx/\2/Xxxx\3.cc,:s,\(.*\)/bt_src/\(.*\)/Test\(.*\).cc$,\1/src/\2/\3.cc,:s,\(.*\)/xxxxxx/\(.*\)/Xxxx\(.*\).cc$,\1/bt_src/\2/Test\3.cc,<CR>

" \h: Switch to header file from a C/C++ source code file (or vice versa).
" Switch from foo.c(c) to foo.h(h) (or vice versa).
map <Leader>h :e %:p:s,.hh$,.X123X,:s,.cc$,.hh,:s,.X123X$,.cc,<CR>

" Open file name under the cursor on a new tab.
map <F8> gf

" Create tag files.
map <F9> :!(myptags; myjtags; myctags)>/dev/null&<CR>

" Execute code formatting on current file.
map <F10> :!$HOME/bin/code_formatting.sh %<CR>

" Delete all trailing whitespace from each line,
" Remove spaces after '(' and before ')'
" Replace consecutive blank lines with a single blank line
" Remove blank lines after trailing '{' or before leading '}'
" Remove some decorator lines
" TODO: improve
inoremap <silent> <F12> <c -O>:call BeatutifySourceCode()<CR>
map <silent> <F12> :call BeatutifySourceCode()<CR>
function! BeatutifySourceCode()
  %s/\s\+$//e
  %s/(\s\+/(/e
  %s/\s\+)/)/e
  %s/\n\{3,}/\r\r/e
  %s/{\n\{2,}/{\r/e
  %s/\n\{2,}}/\r}/e
  g/^\s*\/\/\s*--*\s*/d
  redraw!
endfunction

" Remember cursor position in files
augroup JumpCursorOnEdit
  au!
  autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \   if line("'\"") > 1 && line("'\"") <= line("$") |
    \     let JumpCursorOnEdit_foo = line("'\"") |
    \     let b:doopenfold = 1 |
    \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
    \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
    \        let b:doopenfold = 2 |
    \     endif |
    \     exe JumpCursorOnEdit_foo |
    \   endif |
    \ endif
  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \   exe "normal zv" |
    \   if(b:doopenfold > 1) |
    \       exe  "+".1 |
    \   endif |
    \   unlet b:doopenfold |
    \ endif
augroup END

" Try to check-out read-only file from ClearCase VOB before editing
augroup CheckoutReadOnlyFileInVOBBeforeEditingIt
  au!
  autocmd FileChangedRO *
    \ let filename = expand("%:p") |
    \ if (match(filename, "^/vobs/") == 0) |
    \   silent! call system("/usr/atria/bin/cleartool checkout -unre -nc " . filename) |
    \   redraw! |
    \   set noreadonly |
    \ endif
augroup END
