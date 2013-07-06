" Determine tab label for text mode.
function! MyTextModeTabLabel(n, maxlength)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = bufname(buflist[winnr - 1])
  if name == ''
    " give name to no-name documents
    if &buftype=='quickfix'
      let tablabel = '[Quickfix List]'
    else
      let tablabel = '[No Name]'
    endif
  elseif match(name, '@@') > 1
    " ClearCase versioned file name
    let tablabel = substitute(name, '.*/\(.*@@.*\)', '\1', '')
  else
    " regular files
    let tablabel = fnamemodify(name, ':t')
  endif
  let tablabel = strpart(tablabel, 0, a:maxlength)
  return tablabel
endfunction

" Create the whole tab line
function! MyTextModeInternalTabLine(maxlength)
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " the label is made by MyTextModeTabLabel()
    let s .= '%{MyTextModeTabLabel(' . (i + 1) . ',' . a:maxlength . ')}%#TabLineFill#|'
  endfor

  " after the last tab fill with TabLineFill and reset tab page number
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif
  "echo "len(s) = " . len(s)

  return s
endfunction

" See above why the length is calculated this way...
function! MyTextModeInternalTabLineLength(maxlength)
  let s = ""
  for i in range(tabpagenr('$'))
    let s = s . MyTextModeTabLabel(i+1, a:maxlength) . "|"
  endfor
  let len = strlen(s) + 1
  if tabpagenr('$') > 1
    let len += 1
  endif
  return len
endfunction

" Set up the tab line. Try to fill up the whole line as much as possible.
function! MyTextModeTabLine()
  " You might optimize this value for your needs
  let ABSOLUTE_MAXLENGTH = 42

  " The aim is to determine the optimal (max)length used as max tab label (title) length
  let tries = 0
  let maxlength = ABSOLUTE_MAXLENGTH
  let tablen = MyTextModeInternalTabLineLength(maxlength)
  while tablen > &columns
    let maxlength -= 1
    if maxlength < 1
      let maxlength = 1
    endif
    let tablen = MyTextModeInternalTabLineLength(maxlength)
    let tries += 1
    " Safty belt for infinite loop
    if tries > ABSOLUTE_MAXLENGTH - maxlength "TODO:+1?
      break
    endif
  endwhile
  "echo "The current window has " . &columns . " columns. Tabline length is " . tablen ", maxlength is " . maxlength

  " Use the above calculated length
  let s = MyTextModeInternalTabLine(maxlength)
  return s
endfunction
