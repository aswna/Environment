if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " local filetype changes go here
  au! BufRead,BufNewFile *\,cover setfiletype cover
augroup END
