" Decide which language to use for spelling.
if getline(1) =~? 'hu'
  setlocal spell spelllang=hu
else
  setlocal spell spelllang=en_us
endif
setlocal spell

setlocal textwidth=67
setlocal wrap
