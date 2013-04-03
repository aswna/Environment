if g:running_on_windows_os
  " UltiSnips needs Python
  let python_dir = 'C:\Python27'
  if isdirectory(python_dir)
    let $PATH =  python_dir . ';' . $PATH
  endif
endif
