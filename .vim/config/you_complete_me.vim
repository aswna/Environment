" Fallback config if ~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py is not available
let g:ycm_global_ycm_extra_conf = '~/etc/ycm_extra_conf.py'

" Use clang-based semantic completer and other syntastic checkers
let g:ycm_register_as_syntastic_checker = 0

" '<Leader>d' is already used
let g:ycm_key_detailed_diagnostics = '<Leader><Leader>d'

let g:ycm_complete_in_comments = 1
let g:ycm_allow_changing_updatetime = 0
