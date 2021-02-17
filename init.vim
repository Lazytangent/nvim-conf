source ~/.config/nvim/basic.vim
source ~/.config/nvim/filetypes.vim

" Stuff from regular Vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on

let mapleader = ","
noremap \ ,

map <leader>w :w!<cr>

set noshowmode
set nu
set rnu
set clipboard=unnamed
set list
set listchars=tab:▸\ ,trail:▫
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

" Disable ALE's LSP to use CoC
let g:ale_disable_lsp = 1

" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin("~/.nvim/plugged")
  " Plugin Section
  " Themes
  Plug 'dracula/vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'joshdick/onedark.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'gregsexton/Atom'
  Plug 'rakr/vim-one'

  " Languages/Syntax
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'json', 'markdown', 'yaml', 'html', 'python']
    \ }
  Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale'
  Plug 'mattn/emmet-vim'

  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'plasticboy/vim-markdown'
  Plug 'mrdotb/vim-tailwindcss'
  Plug 'nvie/vim-flake8'
  Plug 'jmcantrell/vim-virtualenv'

  " General Use
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-eunuch'
  Plug 'terryma/vim-smooth-scroll'

call plug#end()

" Color Config Section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors

syntax enable
colorscheme onedark
set background=dark

" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_fenced_languages = [ 'html', 'python', 'css', 'javascript', 'js=javascript', 'json=javascript', 'sass' ]

" Vim-TailwindCSS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>tt :set completefunc=tailwind#complete<cr>

" Vim-Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'python': ['autopep8', 'yapf'],
      \}

" Vim-CoC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-emmet', 'coc-css',
      \ 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver',
      \ 'coc-git', 'coc-graphql', 'coc-pyright', 'coc-sql',
      \ 'coc-sh', 'coc-yank', 'coc-vimlsp', 'coc-jedi',
      \ 'coc-clangd', 'coc-go', 'coc-yaml', 'coc-toml'
      \ 'coc-taxlab', 'coc-tailwindcss', 'coc-spell-checker']

" Vim-Ale Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Open fzf search
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

" Vim-Smooth-Scroll
nnoremap <silent> <C-u> :call smooth_scroll#up(&scroll, 5, 2)<cr>
nnoremap <silent> <C-d> :call smooth_scroll#down(&scroll, 5, 2)<cr>
nnoremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 5, 4)<cr>
nnoremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 5, 4)<cr>

" Use mouse in Vim
set mouse=n

" Vim and Git
nnoremap <leader>gst :Gst<cr>

" Porting in zshrc aliases
autocmd vimenter * let &shell='/bin/zsh -i'

let $FZF_DEFAULT_COMMAND = 'ag -g "" '

