function! OpenAlternateFile()
  let alternate_filename = alternate#FindAlternate()
  if alternate_filename != "0"
    execute 'edit ' . alternate_filename
  endif
endfunction

map <silent> <leader>t :call OpenAlternateFile()<CR>
