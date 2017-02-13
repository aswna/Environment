function! LineNumbersToggle()
  if &number
    setlocal nonumber
    setlocal relativenumber
  elseif &relativenumber
    setlocal nonumber
    setlocal norelativenumber
  else
    setlocal number
    setlocal norelativenumber
  endif
endfunction
