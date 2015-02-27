" Sources the so-called '.site.vim' config files, in case they exist
function! SourceSiteConfig(scriptPath)
    let l:scriptPathLenght = strlen(a:scriptPath)
    let l:lastDotPos = strridx(a:scriptPath, ".")
    if l:scriptPathLenght - l:lastDotPos != 4
        echoerr "invalid config file name:" a:scriptPath
        return
    endif
    let l:siteConfFile = strpart(a:scriptPath, 0, l:lastDotPos) . ".site.vim"
    if filereadable(l:siteConfFile)
        execute "source " . l:siteConfFile
    endif
endfunction
