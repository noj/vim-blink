" Blink Schema indent file
" Language:    Blink Schema
" Maintainer:  Jon Olsson
" Created:     2012-12-04

if exists ("b:did_indent")
   finish
endif
let b:did_indent = 1

setlocal indentexpr=GetBlinkSchemaIndent(v:lnum)

if exists ("*GetBlinkSchemaIndent")
   finish
endif

function! s:GetPrevNonCommentLineNum (line_num)
   let SKIP_LINES = '^\s*#'

   let nline = a:line_num
   while nline > 0
      let nline = prevnonblank (nline-1)
      if getline (nline) !~? SKIP_LINES
         break
      endif
   endwhile

   return nline
endfunction

function! GetBlinkSchemaIndent (line_num)
   let prev_codeline_num = s:GetPrevNonCommentLineNum (a:line_num)
   let prev_codeline = getline (prev_codeline_num)
   let indnt = indent (prev_codeline_num)

   " Previous line ended with a ->
   if prev_codeline =~ '->\s*.*$'
      return indnt + &shiftwidth
   endif

   if prev_codeline =~ ',\s*.*$'
      " Keep indenting
      return indnt
   endif

   return 0
endfunction

