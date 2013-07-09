if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " local filetype changes go here
  au! BufRead,BufNewFile prototype          setfiletype prototype
  au! BufRead,BufNewFile *.prototype        setfiletype prototype
  au! BufRead,BufNewFile prototype.template setfiletype prototype

  au! BufRead,BufNewFile FT_config.lst setfiletype ftconfig
  au! BufRead,BufNewFile FT_parameter.lst setfiletype ftparam
augroup END
