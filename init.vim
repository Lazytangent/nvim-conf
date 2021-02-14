source ~/.config/nvim/basic.vim
source ~/.config/nvim/filetypes.vim

" Stuff from regular Vim
filetype plugin on
filetype indent on

let mapleader = ","
noremap \ ,

map <leader>w :w!<cr>

set ruler
set cmdheight=1
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set showmatch
set mat=2
set foldcolumn=1
set noshowmode
set nu
set rnu
set clipboard=unnamed
set list
set listchars=tab:▸\ ,trail:▫
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

set expandtab
set shiftwidth=2
set tabstop=2
set si
set wrap

" Disable ALE's LSP to use CoC
let g:ale_disable_lsp = 1

call plug#begin("~/.nvim/plugged")
  " Plugin Section
  Plug 'dracula/vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'tpope/vim-commentary'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'joshdick/onedark.vim'
  Plug 'rakr/vim-one'
  Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'json', 'markdown', 'yaml', 'html', 'python']
    \ }
  Plug 'plasticboy/vim-markdown'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale'
  Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-eunuch'
  Plug 'mrdotb/vim-tailwindcss'
  Plug 'arcticicestudio/nord-vim'
  Plug 'gregsexton/Atom'
  " Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
call plug#end()

" Config Section
set termguicolors

syntax enable
" colorscheme nord
colorscheme onedark
" colorscheme one
" colorscheme atom
" colorscheme dracula
set background=dark

let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1
let g:NERDTreeeMinimalUI = 1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERGTreeStatusLink = ''
" Automatically close nvim if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nm :NERDTreeFocus<cr>
nnoremap <leader>py :Prettier<cr>

" Vim-Markdown
let g:markdown_fenced_languages = [ 'html', 'python', 'css', 'javascript', 'js=javascript', 'json=javascript', 'sass' ]

" Vim-TailwindCSS
nnoremap <leader>tt :set completefunc=tailwind#complete<cr>

" Vim-Ale
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'python': ['autopep8', 'yapf'],
      \}

" let g:ale_linters = {
"       \ 'python': ['pylint', 'flake8', 'pycodestyle']
"       \}

" Vim-CoC
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

nnoremap <leader>aF :ALEFix<cr>
nnoremap <leader>aI :ALEInfo<cr>

" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
" function! OpenTerminal()
"   split term://bash
"   resize 10
" endfunction
" nnoremap <C-n> :call OpenTerminal()<cr>

" use alt+hjkl to move between split/vsplit panels
" tnoremap <A-h> <C-\><C-n><C-w>h
" tnoremap <A-j> <C-\><C-n><C-w>j
" tnoremap <A-k> <C-\><C-n><C-w>k
" tnoremap <A-l> <C-\><C-n><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

nnoremap <C-p> :FZF<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

if (has("autocmd") && !has("gui_running"))
  augroup colors
    autocmd!
    let s:background = { "gui": "#282C34", "cterm": "235", "cterm16": "0" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:background })
  augroup END
endif

let $FZF_DEFAULT_COMMAND = 'ag -g "" '

