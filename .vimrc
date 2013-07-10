" This .vimrc and the sourced files are not compatible with older Vim versions.
" At the moment at least 7.3 is required for some features.

" See http://vimdoc.sourceforge.net/htmldoc/options.html#'nocompatible'
" Make Vim behave in a more useful way.
set nocompatible

let g:running_on_windows_os = has("win32") || has("win64")
if g:running_on_windows_os
  " Redefine HOME environment variable, since - on Windows - the company group policy
  " sets it to be on a network drive, which is not available, when not connected to
  " the company network. This leaves Vim with the default settings.
  " On the other hand, we can start Vim with the -u option,
  " see http://vimdoc.sourceforge.net/htmldoc/starting.html#-u.
  let $HOME="C:\\Users\\" . $USERNAME
  "echom "My forced HOME = " . $HOME

  " Needed on Windows
  set runtimepath=$HOME/.vim
  set runtimepath+=$VIMRUNTIME
  set runtimepath+=$HOME/.vim/after
endif


" Loop through the function definition files and source them
for function_file in split(globpath("$HOME/.vim/functions", "*"), "\n")
  execute "source " . function_file
endfor

" Loop through the vimrc config files and source them
for config_file in split(globpath("$HOME/.vim/config", "*"), "\n")
  execute "source " . config_file
endfor
