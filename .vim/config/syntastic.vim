let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"let g:syntastic_debug = 1

let g:syntastic_error_symbol = 'E▸'
let g:syntastic_warning_symbol = 'W▸'
let g:syntastic_style_error_symbol = 'e▸'
let g:syntastic_style_warning_symbol = 'w▸'

let g:syntastic_auto_loc_list = 1

let g:syntastic_stl_format = '[%E{Err: %e}%B{, }%W{Warn: %w}]'

let g:ycm_autoclose_preview_window_after_completion = 1

" C
let g:syntastic_c_checkers = ['make', 'gcc', 'sparse', 'splint']
let g:syntastic_c_include_dirs = ['/usr/include/mysql']
let g:syntastic_c_checkpatch_args = '--ignore CODE_INDENT,LEADING_SPACE --no-summary --no-tree --terse --file'

" C++
let g:syntastic_cpp_checkers = ['gcc', 'cpplint']
let g:syntastic_cpp_include_dirs = g:syntastic_c_include_dirs

" Python (PyLama can use pep8, PyFlakes, PyLint, McCabe and pep257)
let g:syntastic_python_pylama_args = '-l pep8,pyflakes,pep257,mccabe,pylint'
let g:syntastic_python_checkers = ['python', 'frosted', 'pylama', 'py3kwarn']

" Use local pylintrc file if available.
let s:pylintrc_file = ''
if filereadable('.pylintrc')
    let s:pylintrc_file = '.pylintrc'
elseif filereadable('pylintrc')
    let s:pylintrc_file = 'pylintrc'
endif

if s:pylintrc_file != ''
    let g:syntastic_python_pylint_args = '--rcfile=' . s:pylintrc_file
    " Ignore "line too long" error from pep8 hoping that Pylint already checks that.
    let g:syntastic_python_pylama_args .= ' --ignore=E501'
endif

" Shell
let g:syntastic_sh_checkers = ['sh', 'bashate', 'checkbashisms']

" Tcl
let g:syntastic_tcl_checkers = ['nagelfar']
let g:syntastic_tcl_nagelfar_conf = '$HOME/usr/src/nagelfar12/nagelfar.syntax'
