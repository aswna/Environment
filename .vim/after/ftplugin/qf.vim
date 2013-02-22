setlocal colorcolumn=""

if exists("*SourceSiteConfig")
    call SourceSiteConfig(escape(expand('<sfile>:p'), '\'))
endif

