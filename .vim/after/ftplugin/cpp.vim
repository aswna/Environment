let g:clang_auto_select = 0
let g:clang_close_preview = 1
let g:clang_complete_auto = 0
let g:clang_complete_copen = 1
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1
let g:clang_conceal_snippets = 1
let g:clang_hl_errors = 1
let g:clang_periodic_quickfix = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_trailing_placeholder = 0
let g:clang_use_library = 1
let g:clang_user_options = "-Wall"

let g:SuperTabDefaultCompletionType = "context"

set updatetime=2000 " QuickFix Window should be updated every 2.0 sec

if exists("*SourceSiteConfig")
  call SourceSiteConfig(escape(expand('<sfile>:p'), '\'))
endif
