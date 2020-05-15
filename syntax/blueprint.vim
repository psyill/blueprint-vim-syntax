if exists('b:current_syntax')
    finish
endif
let b:current_syntax = 'blueprint'

syntax case match

syntax match blueprintOnelineComment /\/\/.*$/
syntax region blueprintMultilineComment start=/\/\*/ end=/\*\//
syntax cluster blueprintComment add=blueprintOnelineComment,blueprintMultilineComment

syntax keyword blueprintEquals nextgroup=blueprintBracketBlock skipwhite =
syntax keyword blueprintSubdirs nextgroup=blueprintEquals skipwhite subdirs

syntax match blueprintModuleType /\k\+\(\_\s*{\)\@=/

syntax keyword blueprintColon contained containedin=@blueprintBraceBlock nextgroup=@blueprintValue skipwhite :
syntax keyword blueprintComma contained containedin=@blueprintBlock ,

syntax region blueprintBraceBlock fold transparent start="{" end="}" contains=ALLBUT,blueprintModuleType,blueprintSubdirs,blueprintEquals
syntax region blueprintBracketBlock fold transparent start="\[" end="]" contains=ALLBUT,blueprintModuleType,blueprintSubdirs,blueprintEquals,@blueprintProperty
syntax cluster blueprintBlock add=blueprintBraceBlock,blueprintBracketBlock

syntax match blueprintGeneralProperty contained containedin=blueprintBraceBlock nextgroup=blueprintColon skipwhite /\k\+\(\_\s*:\)\@=/
syntax keyword blueprintNameProperty contained containedin=blueprintBraceBlock nextgroup=blueprintColon skipwhite name
syntax cluster blueprintProperty add=blueprintGeneralProperty,blueprintNameProperty

syntax match blueprintString contained containedin=@blueprintBlock /"[^"\n]*"/
syntax keyword blueprintBoolean contained containedin=@blueprintBlock true false
syntax cluster blueprintValue add=@blueprintBlock,blueprintString,blueprintBoolean

syntax case ignore

syntax keyword blueprintTodo contained containedin=@blueprintComment TODO

highlight default link blueprintOnelineComment Comment
highlight default link blueprintMultilineComment Comment
highlight default link blueprintSubdirs Keyword
highlight default link blueprintEquals Operator
highlight default link blueprintColon Operator
highlight default link blueprintComma Delimiters
highlight default link blueprintGeneralProperty Identifier
highlight default link blueprintNameProperty Special
highlight default link blueprintModuleType Type
highlight default link blueprintString String
highlight default link blueprintBoolean Boolean
highlight default link blueprintTodo Todo
