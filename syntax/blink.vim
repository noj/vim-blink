" Blink syntax file
" Language  : Blink (http://blinkprotocol.org)
" Maintainer: Jon Olsson

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Types
syn keyword blinkType i8 u8
syn keyword blinkType i16 u16
syn keyword blinkType i32 u32
syn keyword blinkType i64 u64
syn keyword blinkType decimal f64
syn keyword blinkType date
syn keyword blinkType timeOfDayMilli
syn keyword blinkType timeOfDayNano
syn keyword blinkType nanotime
syn keyword blinkType millitime
syn keyword blinkType bool
syn keyword blinkType string
syn keyword blinkType object

" Keywords
syn keyword blinkKeyword namespace
syn keyword blinkKeyword schema
syn match blinkKeyword "->"

" 'Operators'
syn match blinkOperator "?"
syn match blinkOperator "*"
syn match blinkOperator "|"
syn match blinkOperator "\[\]"

" Number literals
syn match blinkNumber "\<0x\x\+\>"
syn match blinkNumber "\<\d\+\>"

" Comments
syn match blinkTodo "[tT][oO][dD][oO]" contained
syn match blinkComment "#.*$" contains=blinkTodo

hi link blinkType Type
hi link blinkKeyword Keyword
hi link blinkNumber Number
hi link blinkComment Comment
hi link blinkTodo Todo
hi link blinkOperator Operator

let b:current_syntax = "blink"

