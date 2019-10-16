" Syntax file for note-taking
" author: Jesús Plasencia (jxpp@chigui.re)

if exists("b:current_syntax")
  finish
endif

syn keyword importantKeyword OJO IMPORTANTE 
syn keyword checkLaterKeyword REVISAR

syn match critical "^!.*$"
syn match moreInfo "^\..*$"
syn match question "^?.*$"
syn match interestingRegion "^\{\}$"

" syn region interestingRegion start="\[" end="\]" fold transparent

let b:current_syntax = "notes"

hi importantKeyword cterm=bold ctermfg=red
hi checkLaterKeyword cterm=bold ctermfg=yellow

hi critical cterm=underline ctermfg=red
hi moreInfo cterm=underline ctermfg=blue
hi question cterm=underline ctermfg=darkyellow
hi interestingRegion cterm=italic ctermfg=green
