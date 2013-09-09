if v:version >= 700
    try
        call tcomment#DefineType('cccs', '# %s')
        call tcomment#DefineType('ftconfig', '# %s')
    catch
    endtry
endif
