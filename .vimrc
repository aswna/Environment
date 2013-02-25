" This .vimrc and the sourced files are not compatible with older vim versions.
" At the moment at least 7.3 is required for some features.

" See http://vimdoc.sourceforge.net/htmldoc/options.html#'nocompatible'
" Make Vim behave in a more useful way.
set nocompatible

set runtimepath=$HOME/.vim
set runtimepath+=$VIMRUNTIME
set runtimepath+=$HOME/.vim/after
set runtimepath+=$HOME/git/github/vim-addon-manager

" Loop through the function definition files and source them
for function_file in split(globpath("$HOME/.vim/functions", "*"), "\n")
  execute "source " . function_file
endfor

" Loop through the vimrc config files and source them
for config_file in split(globpath("$HOME/.vim/config", "*"), "\n")
  execute "source " . config_file
endfor
