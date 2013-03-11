function! FoldColumnToggle()
  if &foldcolumn
    let g:last_fold_column_width = &foldcolumn
    setlocal foldcolumn=0
  else
    let &l:foldcolumn = g:last_fold_column_width
  endif
endfunction
