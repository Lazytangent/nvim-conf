syntax keyword pythonDecorator True None False self
" let b:AutoPairs = AutoPairsDefine({ "f'": "'", "r'": "'", "b'": "'" })
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal textwidth=79

nnoremap <buffer> <localleader><leader>r :!python %<cr>
