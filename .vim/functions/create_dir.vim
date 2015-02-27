" Try to create directory if does not exist
function! CreateDir(dir_to_create)
    if !isdirectory(expand(a:dir_to_create))
        if exists("*mkdir")
            call mkdir(expand(a:dir_to_create), "p")
        else
            echoerr "Cannot create directory: " . a:dir_to_create
        endif
    endif
endfunction
