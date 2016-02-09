if v:version >= 700
    try
        call tcomment#DefineType('json', {'col': 1, 'commentstring': '# %s'})
    catch
    endtry
    " try
    "     call tcomment#DefineType('<filetype>', '# %s')
    " catch
    " endtry
endif
