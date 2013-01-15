" Vim syntax file
" Language:    SUN package prototype
" Maintainer: https://github.com/aswna 
" Last Change: 2011 Jul 22

if exists("b:current_syntax")
 finish
endif

syn match pComment   '^#.*'
syn match pInfo      '^i.*'
syn match pFilename  '^f [^ ]\+ [^ ]\+'
syn match pDirectory '^d [^ ]\+ [^ ]\+'
syn match pLink      '^l [^ ]\+ [^ ]\+'
syn match pLink      '^s [^ ]\+ [^ ]\+'
syn match pSearch    '^! *search'
syn match pType      ' \(ipf\|plug\) '

let b:current_syntax = "prototype"

hi def link pComment    Comment
hi def link pInfo       Special
hi def link pFilename   Constant
hi def link pDirectory  Label
hi def link pLink       PreProc
hi def link pSearch     Statement
hi def link pType       Special

" vim: ts=4
