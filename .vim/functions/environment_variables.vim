" Checks whether the given environment variable is set or not
function! IsEnvVarSet(envVar)
  if strlen(a:envVar) > 0
    return 1
  endif
  return 0
endfunction
