if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = "lox"
elseif exists("b:current_syntax") && b:current_syntax == "lox"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match   loxSpecial	       "\\\d\d\d\|\\."

syn region  loxComment	       start="/\*"  end="\*/" contains=@Spell
syn region  loxStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=loxSpecial
syn region  loxStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=loxSpecial
syn region  loxStringT	       start=+`+  skip=+\\\\\|\\`+  end=+`+	contains=loxSpecial,loxEmbed

syntax keyword loxBoolean true false
syntax keyword loxConditional if else
syntax keyword loxFunction fun
syntax keyword loxIdentifier this var
syntax keyword loxRepeat for while
syntax keyword loxStatement return print
syntax keyword loxNull null

syntax match loxBraces "[{}\[\]]"
syntax match loxParens "[()]"

if main_syntax == "lox"
  syntax sync fromstart
  syntax sync maxlines=100

  syntax sync ccomment loxComment
endif

syn match   loxNumber           "\<0[bB][0-1]\+\(_[0-1]\+\)*\>"
syn match   loxNumber           "\<0[oO][0-7]\+\(_[0-7]\+\)*\>"
syn match   loxNumber           "\<0\([0-7]\+\(_[0-7]\+\)*\)\?\>"
syn match   loxNumber           "\<0[xX][0-9a-fA-F]\+\(_[0-9a-fA-F]\+\)*\>"
syn match   loxNumber           "\<\d\+\(_\d\+\)*[eE][+-]\?\d\+\>"
syn match   loxNumber           "\<[1-9]\d*\(_\d\+\)*\(\.\(\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\)\?\)\?\>"
syn match   loxNumber           "\<\(\d\+\(_\d\+\)*\)\?\.\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\>"
syn match   loxNumber           "\<\d\+\(_\d\+\)*\.\(\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\)\?\>"

highlight default link loxComment Comment
highlight default link loxBoolean Boolean
highlight default link loxNumber loxValue
highlight default link loxConditional Conditional
highlight default link loxFunction Function
highlight default link loxBraces Function
highlight default link loxIdentifier Identifier
highlight default link loxRepeat Repeat
highlight default link loxStatement Statement
highlight default link loxStringS String
highlight default link loxStringD String
highlight default link loxStringT String
highlight default link loxNull Keyword

let b:current_syntax = "lox"
if main_syntax == "lox"
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save
