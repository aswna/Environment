setlocal colorcolumn=""

au FileType qf call AdjustWindowHeight(1, 5)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$")+1, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

if exists("*SourceSiteConfig")
    call SourceSiteConfig(escape(expand('<sfile>:p'), '\'))
endif

