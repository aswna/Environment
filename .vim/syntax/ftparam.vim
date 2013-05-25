" Vim syntax file for FT_parameter.lst files

if exists("b:current_syntax")
  finish
endif

syn match pComment          '^#.*'
syn match pModule           '[A-Z_]\+' contained
syn match pVariableLabel    '^[^;]\+'
syn match pDelimiter        ';'
syn match pVariableValue    '[^;\ ]' contained

syn region pModuleRegion        start=/^\[/ end=/\]/ contains=pModule
syn region pVariableValueRegion start=/;/   end=/$/  contains=pVariableValue

let b:current_syntax = "ftparam"

hi def link pComment          Comment
hi def link pModule           Define
hi def link pVariableLabel    Identifier
hi def link pDelimiter        Ignore
hi def link pVariableValue    String
