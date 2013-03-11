" Delete all trailing whitespace from each line,
" Remove spaces after '(' and before ')'
" Replace consecutive blank lines with a single blank line
" Remove blank lines after trailing '{' or before leading '}'
" Remove some decorator lines
" TODO: improve
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
