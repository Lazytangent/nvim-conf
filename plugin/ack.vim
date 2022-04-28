if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep\ --smart-case
  let g:ackprg = 'ag --vimgrep --smart-case'
endif
