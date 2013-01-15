" Vim global plugin for checking out a read-only file from the VOB,
" before changing it.
" Last Change:	2011 Jun 14
" Maintainer:	https://github.com/aswna

if exists("g:loaded_checkoutrofile")
  finish
endif
let g:loaded_checkoutrofile = 1

augroup CheckoutReadOnlyFileInVOBBeforeEditingIt
  au!
  autocmd FileChangedRO *
    \ let filename = expand("%:p") |
    \ if match(filename, "/vobs") >= 0 |
    \   silent! call system("/usr/atria/bin/cleartool checkout -unre -nc " . filename) |
    \   redraw! |
    \   set noreadonly |
    \ endif
augroup END
