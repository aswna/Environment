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
