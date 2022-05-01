function! s:QfRemoveAtCursor() abort
  let currline = line('.')
  let items = getqflist()->filter({ index -> (index + 1) != currline })
  call setqflist(items, 'r')
  execute 'normal ' . currline . 'G'
endfunction

augroup quickfix
  autocmd!
  autocmd FileType qf nnoremap <buffer><silent> x :call <SID>QfRemoveAtCursor()<cr>
augroup END
