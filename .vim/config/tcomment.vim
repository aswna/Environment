if v:version >= 700
    try
        call tcomment#DefineType('ftconfig', '# %s')
    catch
    endtry
endif
