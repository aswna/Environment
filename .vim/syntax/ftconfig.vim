" Vim syntax file for FT_config.lst files

if exists("b:current_syntax")
  finish
endif

syn keyword pKeyword true false

syn match pComment          '^#.*'
syn match pModule           '[A-Z]\+' contained
syn match pVariableName     '^[A-Z_0-9]\+'
syn match pEqual            '='
syn match pDelimiter        ',' contained
syn match pSpecialDelimiter ';' contained
syn match pVariableValue    '[A-Za-z_0-9\-\.\ ]\+' contained
syn match pNodeName         'node[0-9]\+A\?' contained
syn match pNumber           '[0-9]\+' contained

syn region pModuleRegion        start=/^\[/ end=/\]/ contains=pModule
syn region pVariableValueRegion start=/=/   end=/$/  contains=pKeyword,pDelimiter,pSpecialDelimiter,pVariableValue,pNodeName,pNumber

let b:current_syntax = "ftconfig"

hi def link pKeyword          Keyword
hi def link pComment          Comment
hi def link pModule           Define
hi def link pVariableName     Identifier
hi def link pEqual            Ignore
hi def link pDelimiter        Ignore
hi def link pSpecialDelimiter SpecialChar
hi def link pVariableValue    String
hi def link pNodeName         Label
hi def link pNumber           Number
