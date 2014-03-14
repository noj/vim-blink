" Blink tag format syntax highlighting
" Language  : Blink (http://blinkprotocol.org)
" Maintainer: Jon Olsson

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Types
syn match blinkType "@[_a-zA-Z][_a-zA-Z0-9:]\+"
syn match blinkTag "[_a-zA-Z][_a-zA-Z0-9]\+="

syn match blinkDecNumber display "\<-\?[0-9]\+\>"
syn match blinkHexNumber display "\<[0-9a-fA-F]\+\>"

" Link highlighting
hi link blinkType Type
hi link blinkTag Identifier
hi link blinkDecNumber Number
hi link blinkHexNumber Number

let b:current_syntax = "blink-tag"

