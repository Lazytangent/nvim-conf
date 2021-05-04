""""""""""""""""""""""""""""""
" => Git section
""""""""""""""""""""""""""""""
autocmd FileType gitcommit setlocal textwidth=72

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
autocmd FileType python syntax keyword pythonDecorator True None False self

autocmd BufNewFile,BufRead *.jinja set syntax=htmljinja
autocmd BufNewFile,BufRead *.mako set filetype=mako

autocmd FileType python inoremap <buffer> $r return
autocmd FileType python inoremap <buffer> $i import
autocmd FileType python inoremap <buffer> $p print
autocmd FileType python inoremap <buffer> $f # --- <esc>a
autocmd FileType python map <buffer> <leader>1 /class
autocmd FileType python map <buffer> <leader>2 /def
autocmd FileType python map <buffer> <leader>C ?class
autocmd FileType python map <buffer> <leader>D ?def
autocmd FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})
autocmd BufNewFile,BufRead *.py setlocal softtabstop=4 expandtab autoindent shiftwidth=4 textwidth=79

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
autocmd FileType javascript call JavaScriptFold()
autocmd FileType javascript setlocal fen
autocmd FileType javascript setlocal nocindent
autocmd FileType javascript inoremap <buffer> $r return

function! JavaScriptFold()
    setlocal foldmethod=syntax
    setlocal foldlevelstart=1
    syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setlocal foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
" set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html


""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""
let vim_markdown_folding_disabled = 1
autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead /*.rasi setfiletype css
autocmd BufNewFile,BufRead *.md setlocal textwidth=80

autocmd FileType go :setlocal shiftwidth=4 softtabstop=4
