" Vim syntax file

if exists("b:current_syntax")
  finish
endif

syn match coverIsCovered  "^+.*\|^>.*"
syn match coverNotCovered "^-.*\|^!.*"
syn match coverIgnored    "^0.*\|^  $"

hi def link coverIsCovered  Comment
hi def link coverNotCovered Error
hi def link coverIgnored    Ignore

let b:current_syntax = "cover"
