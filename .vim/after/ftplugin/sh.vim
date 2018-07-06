" Put braces around word under cursor
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>} viw<esc>a}<esc>hbi{<esc>lel

" Put braces around selection
" TODO: This only works for selections that are created "forwardly"
vnoremap <leader>{ <esc>a}<esc>gvo<esc>i{<esc>gvo<esc>ll
vnoremap <leader>} <esc>a}<esc>gvo<esc>i{<esc>gvo<esc>ll

let g:sh_fold_enabled=1
setlocal foldmethod=syntax
