function! BeatutifySourceCode()
  %s/\s\+$//e
  %s/(\s\+/(/e
  %s/\s\+)/)/e
  %s/\n\{3,}/\r\r/e
  %s/{\n\{2,}/{\r/e
  %s/\n\{2,}}/\r}/e
  g/^\s*\/\/\s*--*\s*/d
  redraw!
endfunction
