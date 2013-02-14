let myscriptsfile="$HOME/.vim/scripts.vim"

let spellfile="$HOME/.vim/spellfile.add"

" Remove all abbreviations for Command-line mode
cabclear

" See http://vimdoc.sourceforge.net/htmldoc/options.html#'backspace'
" allow backspacing over autoindent, over line breaks (join lines), over the
" start of insert
set backspace=indent,eol,start

" filename completion
set wildmode=longest:full
