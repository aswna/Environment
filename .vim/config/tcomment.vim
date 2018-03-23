if v:version >= 700
    try
        call tcomment#type#Define('json', {'col': 1, 'commentstring': '# %s'})
    catch
    endtry
    " try
    "     call tcomment#type#Define('<filetype>', '# %s')
    " catch
    " endtry
endif
