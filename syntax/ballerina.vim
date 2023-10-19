if exists("b:current_syntax")
	finish
endif

" Ballerina types from the table
syntax keyword balBasicSimpleTypes nil boolean int float decimal
syntax keyword balBasicSequenceTypes string XML
syntax keyword balBasicStructuredTypes array tuple map record table
syntax keyword balBasicBehavioralTypes error future object typedesc handle stream
syntax keyword balOtherTypes singleton readonly any never optional union intersection distinct anydata json byte

" Existing syntax rules
syntax keyword balModifiers public private external final remote const const isolated readonly
syntax keyword balConditions if else while foreach for
syntax keyword balQueryExpressions select from where group by order limit do ascending descending
syntax keyword balIs is in
syntax keyword balImport import returns return
syntax keyword balObject object record
syntax keyword balFunc function resource worker service
syntax keyword balError check checkpanic

" Operators
syntax match balOperator "\v\*"
syntax match balOperator "\v\|"
syntax match balOperator "\v/"
syntax match balOperator "\v\+"
syntax match balOperator "\v-"
syntax match balOperator "\v\?"
syntax match balOperator "\v\|"
syntax match balOperator "\v\%"
syntax match balOperator "\v\*\="
syntax match balOperator "\v/\="
syntax match balOperator "\v\!\=\="
syntax match balOperator "\v\!\="
syntax match balOperator "\v\+\="
syntax match balOperator "\v-\="
syntax match balOperator "\v\="

" String and comments
syntax region balString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region balComment start=/\v(\/\/|#)/ skip=/\v\\./ end=/\v\_$/

highlight link balModifiers Keyword
highlight link balOperator Operator
highlight link balIs Operator
highlight link balBasicSimpleTypes Type
highlight link balBasicSequenceTypes Type
highlight link balBasicStructuredTypes Type
highlight link balBasicBehavioralTypes Type
highlight link balOtherTypes Type
highlight link balImport Identifier
highlight link balObject Keyword
highlight link balFunc Function
highlight link balComment Comment
highlight link balString String
highlight link balConditions Statement
highlight link balQueryExpressions Statement
highlight link balError Underlined


" Custom highlight groups
highlight balBasicSimpleTypes gui=bold
highlight balBasicSequenceTypes gui=italic
highlight balBasicStructuredTypes gui=underline
highlight balBasicBehavioralTypes gui=reverse
highlight balOtherTypes gui=underline,bold

" Linking
highlight link balModifiers Keyword
highlight link balOperator Operator
highlight link balIs Operator
highlight link balImport Identifier
highlight link balObject Keyword
highlight link balFunc Function
highlight link balComment Comment
highlight link balString String
highlight link balConditions Statement
highlight link balQueryExpressions Statement
highlight link balError Underlined

" Using custom groups for different kinds of types
highlight link balBasicSimpleTypes balBasicSimpleTypes
highlight link balBasicSequenceTypes balBasicSequenceTypes
highlight link balBasicStructuredTypes balBasicStructuredTypes
highlight link balBasicBehavioralTypes balBasicBehavioralTypes
highlight link balOtherTypes balOtherTypes

" Backtick Templates
" https://ballerina.io/learn/by-example/backtick-templates/
" Backtick Templates and expressions within
syntax region balBacktickTemplate start=/\v`/ end=/\v`/ contains=balTemplateExpression
syntax match balTemplateExpression "\v\$\{[^\}]+\}" contained
highlight link balBacktickTemplate String
highlight link balTemplateExpression Special


" set relativenumber

let b:current_syntax = "ballerina"
