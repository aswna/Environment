" Fallback config
let g:ycm_global_ycm_extra_conf = '~/etc/.ycm_extra_conf.py'

" Use clang-based semantic completer and other syntastic checkers
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_show_diagnostics_ui = 1

" '<Leader>d' is already used
let g:ycm_key_detailed_diagnostics = '<Leader><Leader>d'

let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_always_populate_location_list = 1
