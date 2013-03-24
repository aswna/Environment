" do syntax checks when buffers are first loaded
let g:syntastic_check_on_open = 1

let g:syntastic_error_symbol = 'E►'
let g:syntastic_warning_symbol = 'W►'
let g:syntastic_style_error_symbol = 'e▸'
let g:syntastic_style_warning_symbol = 'w▸'

"let g:syntastic_auto_jump = 1

let g:syntastic_auto_loc_list = 1

let g:syntastic_stl_format = '[%E{Err: %e}%B{, }%W{Warn: %w}]'

let g:syntastic_loc_list_height = 5

let g:ycm_autoclose_preview_window_after_completion = 1

" C
let g:syntastic_c_checkers = ['gcc', 'checkpatch']
let g:syntastic_c_include_dirs = ['/usr/include/mysql']
"let g:syntastic_c_checkpatch_args = '--ignore CODE_INDENT,LEADING_SPACE --no-summary --no-tree --terse --file'

" C++
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_include_dirs = g:syntastic_c_include_dirs

" Python
let g:syntastic_python_checkers = ['python', 'pyflakes', 'pylint']

" Shell
let g:syntastic_sh_checkers = ['sh', 'checkbashisms']

" Tcl (do not use tclsh checker, it executes the script!)
let g:syntastic_tcl_checkers = ['nagelfar']
let g:syntastic_tcl_nagelfar_conf = '$HOME/usr/src/nagelfar12/nagelfar.syntax'
