if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " local filetype changes go here
  au! BufRead,BufNewFile prototype          setfiletype prototype
  au! BufRead,BufNewFile *.prototype        setfiletype prototype
  au! BufRead,BufNewFile prototype.template setfiletype prototype
augroup END
