let myscriptsfile="$HOME/.vim/scripts.vim"

let spellfile="$HOME/.vim/spellfile.add"

set iskeyword-=:

" See http://vimdoc.sourceforge.net/htmldoc/options.html#'backspace'
" allow backspacing over autoindent, over line breaks (join lines), over the
" start of insert
set backspace=indent,eol,start

" filename completion
set wildmode=longest:full

" Enable autoselect: visually highlighted text is available for pasting.
set guioptions+=a
