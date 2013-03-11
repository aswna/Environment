if g:win
  " for UltiSnips
  let python_dir = 'C:\Python27'
  if isdirectory(python_dir)
    let $PATH =  python_dir . ';' . $PATH
  endif
endif

call vam#ActivateAddons(['UltiSnips'], {'auto_install' : 0})
