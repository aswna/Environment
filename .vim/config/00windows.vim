if g:running_on_windows_os
  " UltiSnips, Syntstic needs Python
  let python_dir = 'C:\\Python27'
  if isdirectory(python_dir)
    let $PATH =  python_dir . ';' . $PATH
  endif
  " Outlook-vim needs cscript.exe
  let $PATH = "C:\\Windows\\System32" . ';' . $PATH
endif

if g:running_on_windows_os
  set encoding=utf-8
endif
