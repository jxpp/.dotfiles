" Syntax file for logs
" author: Jesús Plasencia (jxpp@chigui.re)

if exists("b:current_syntax")
  finish
endif

syn match logStart "^[0-9]{4}-[0-9]{2}-[0-9]{2} "
syn match logTag "#[a-z_]+"
syn match logCategory "@[A-Z][a-z]+"

let b:current_syntax = "log"

hi logStart cterm=underline ctermfg=blue
hi logTag cterm=bold ctermfg=red
hi logCategory cterm=bold ctermfg=darkyellow
