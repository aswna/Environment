" decrease default timeout for key sequences
set timeoutlen=500

" for PuTTY (or screen)
if $TERM==#"vt100" || $TERM=~"-256color"
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

  " Ctrl-Up / Ctrl-Down: move the current tab to the left / right
  "nnoremap <silent> OA :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
  "nnoremap <silent> OB :execute 'silent! tabmove ' . tabpagenr()<CR>
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

if $TERM=~"-256color"
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

" Several mappings are stolen from https://github.com/nvie/vimrc/blob/master/vimrc

" Map space to center on line
nmap <space> zz

" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$

" Move non linewise in wrapped text
nnoremap j gj
nnoremap k gk

" No need to press Shift, real optimization for almost all Vim commands.
nnoremap ; :
nnoremap <leader>; ;

" Toggle show/hide invisible chars
nnoremap <silent> <Leader>i :set list!<CR>

" Toggle line numbers
nnoremap <silent> <Leader>N :setlocal number!<CR>

" Toggle the foldcolumn
nnoremap <silent> _f :call FoldColumnToggle()<CR>
let g:last_fold_column_width = 4  " Pick a sane default for the foldcolumn

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Quickly get out of insert mode without your fingers having to leave the home row
" Probably we should use CTRL-[.
inoremap jk <Esc>

" Quote word under cursor
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Quote current selection
" TODO: This only works for selections that are created "forwardly"
vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>ll
vnoremap <leader>' <esc>a'<esc>gvo<esc>i'<esc>gvo<esc>ll

nnoremap <silent> <C-Left>  :tabprevious<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap tj :tabprevious<CR>
nnoremap tk :tabnext<CR>
nnoremap tt :tabnew<Space>
nnoremap tm :tabmove<Space>

" Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>q :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>e :YcmCompleter GoToDefinition<CR>
nnoremap <leader>w :YcmCompleter GoToDeclaration<CR>

" Execute macro q
map <F1> @q

" Open new tab with the next file
map <silent> <F2> :tabnew<CR>:silent! n<CR>

" Using <F3> to toggle spellcheck (Vim version >= 7)
inoremap <silent> <F3> <c -O>:set spell!<CR>
map <silent> <F3> :set spell!<CR>

" Using <F4> to toggle hlsearch
inoremap <silent> <F4> <c -O>:set hlsearch!<CR>
map <silent> <F4> :set hlsearch!<CR>

" Check-out file (ClearCase)
map <F5> :Ctcou<CR>

" Undo check-out file (ClearCase)
map <F6> :Ctunco<CR>

" \d: Diff to previous verion (ClearCase).
nmap <silent> <Leader>d :Ctpdif<CR>

set pastetoggle=<F7>

" Open file name under the cursor on a new tab.
map <F8> gf
