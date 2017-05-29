if &diff
    let g:syntastic_check_on_open = 0
else
    let g:syntastic_check_on_open = 1
endif
let g:syntastic_check_on_wq = 0
"let g:syntastic_debug = 1

let g:syntastic_error_symbol = 'E▸'
let g:syntastic_warning_symbol = 'W▸'
let g:syntastic_style_error_symbol = 'e▸'
let g:syntastic_style_warning_symbol = 'w▸'

let g:syntastic_auto_loc_list = 1

let g:syntastic_stl_format = '[%E{Err: %e}%B{, }%W{Warn: %w}]'

" C
let g:syntastic_c_checkers = ['make', 'gcc', 'sparse', 'splint']
let g:syntastic_c_checkpatch_args = '--ignore CODE_INDENT,LEADING_SPACE --no-summary --no-tree --terse --file'

" C++
let g:syntastic_cpp_checkers = ['gcc', 'cppcheck', 'cpplint']

" Python (PyLama supports pep8, PyFlakes, PyLint, McCabe, pep257, pydocstyle,
" isort and pycodestyle) Note: pep8 => pycodestyle, pep257 => pydocstyle
let g:syntastic_python_pylama_args = '-l pycodestyle,pyflakes,mccabe'
let g:syntastic_python_checkers = ['python', 'frosted', 'isort', 'pylama', 'pylint', 'pydocstyle', 'py3kwarn']

" Use local pylintrc file if available.
let s:pylintrc_file = ''
if filereadable('.pylintrc')
    let s:pylintrc_file = '.pylintrc'
elseif filereadable('pylintrc')
    let s:pylintrc_file = 'pylintrc'
elseif filereadable('resources/pylintrc')
    let s:pylintrc_file = 'resources/pylintrc'
endif

if s:pylintrc_file != ''
    let g:syntastic_python_pylint_args = '--rcfile=' . s:pylintrc_file
    " Ignore "line too long" error from pep8/pycodestyle hoping that Pylint already checks that
    let g:syntastic_python_pylama_args .= ' --ignore=E501'
endif

" Shell
let g:syntastic_sh_checkers = ['sh', 'bashate', 'shellcheck', 'checkbashisms']

" Tcl
let g:syntastic_tcl_checkers = ['nagelfar']
let g:syntastic_tcl_nagelfar_conf = '$HOME/usr/src/nagelfar12/nagelfar.syntax'
