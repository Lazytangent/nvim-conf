" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500
filetype plugin indent on
set autoread
autocmd FocusGained,BufEnter * checktime

let mapleader = ","
let localmapleader = "\\"
nnoremap \ ,

" Quick Save Commands
nnoremap <leader>w :w<cr>
nnoremap <leader>wq :wq<cr>
cnoremap Q q!
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" More things
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
nnoremap <leader>qa :qa<cr>

" Line numbering shortcuts
nnoremap <leader>rnu :set rnu!<cr>
nnoremap <leader>nnu :set nu!<cr>

" Reload vimrc
nnoremap <localleader>rc :source ~/.config/nvim/init.vim<cr>

" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7
let $LANG='en'

set wildmenu
set wildmode=longest:full,list:full
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set showcmd
set cmdheight=1
set ruler
set hidden
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set foldcolumn=1
set noshowmode
set number
set relativenumber
set numberwidth=5
set clipboard=unnamed
set list
" set listchars=tab:▸\ ,trail:▫
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set mouse=a
set spell
set cursorline
set modeline

set foldenable
set foldlevelstart=10
nnoremap <leader>fu zM<cr>
nnoremap <leader>uf zR<cr>

set path+=**

"{{{ Tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <localleader>ct :!ctags -R .<cr><cr>
command! MakeTags !ctags -R .
set tags=./tags;,tags;$HOME

" Moving around directories
nnoremap <localleader>cd :cd %:h<cr>

" Easier movement across wrapped lines
nmap j gj
nmap k gk

" Don't go into Ex mode
map Q gq

" }}}
" Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup
set noswapfile

" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=2
set tabstop=8
set softtabstop=2

set linebreak
set wrap

set autoindent

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has("autocmd")
  autocmd BufWritePre *.ts,*.txt,*.js,*.py,*.wiki,*.sh,*.vim :call CleanExtraSpaces()
endif

" Helper Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" open new split panes to right and below
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright
set splitbelow

" Line movement
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-k>  :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<cr>``
nnoremap <silent> <C-j>  :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<cr>``

inoremap <silent> <C-k>  :<C-O>m`<C-O>:move -2<cr><C-O>``
inoremap <silent> <C-j>  :<C-O>m`<C-O>:move +1<cr><C-O>``

vnoremap <silent> <C-k>  :<C-U>exec "'<,'>move '<-" . (1+v:count1)<cr>gv
vnoremap <silent> <C-j>  :<C-U>exec "'<,'>move '>+" . (0+v:count1)<cr>gv
