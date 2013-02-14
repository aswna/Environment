" ClearCase plugin settings -->
let g:ccaseNoComment=1 " do not ask for comment
let g:ccaseAutoRemoveCheckout=1 " remove .keep file
" ClearCase plugin settings --|

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
