" Disable ALE's LSP to use CoC
let g:ale_disable_lsp = 1

" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin("~/.config/nvim/plugged")
  " Plugin Section
  " Themes
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'joshdick/onedark.vim'

  " Languages/Syntax
  Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> coc#util#install() } }
  Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'json', 'markdown', 'yaml', 'html', 'python']
    \ }
  Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale'
  Plug 'mattn/emmet-vim'
  Plug 'pantharshit00/vim-prisma'

  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'heavenshell/vim-jsdoc', {
    \ 'for': ['javascript', 'javascript.jsx', 'typescript'],
    \ 'do': 'make install'
    \}
  Plug 'plasticboy/vim-markdown'
  Plug 'mrdotb/vim-tailwindcss'
  Plug 'nvie/vim-flake8'
  Plug 'jmcantrell/vim-virtualenv'

  " General Use
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-dadbod'
  Plug 'tpope/vim-heroku'
  Plug 'tpope/vim-dotenv'
  Plug 'terryma/vim-smooth-scroll'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-line'
  Plug 'christoomey/vim-sort-motion'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'vim-test/vim-test'

call plug#end()

" Vim-Test
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> t<C-n> :TestNearest<cr>
nmap <silent> t<C-f> :TestFile<cr>
nmap <silent> t<C-s> :TestSuite<cr>
nmap <silent> t<C-l> :TestLast<cr>
nmap <silent> t<C-g> :TestVisit<cr>

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

" Vim-Prettier
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>py :Prettier<cr>

" Vim-Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_fenced_languages = [ 'html',
      \ 'python', 'css', 'javascript', 'js=javascript',
      \ 'json=javascript', 'sass',
      \ 'viml=vim', 'vim', 'bash=sh']

" Vim-TailwindCSS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>tw :set completefunc=tailwind#complete<cr>

" Vim-Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'python': ['autopep8', 'yapf'],
      \}

let g:ale_change_sign_column_color = 1

" Vim-CoC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-emmet', 'coc-css',
      \ 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver',
      \ 'coc-git', 'coc-pyright', 'coc-sql',
      \ 'coc-sh', 'coc-yank', 'coc-vimlsp', 'coc-jedi',
      \ 'coc-clangd', 'coc-go', 'coc-yaml', 'coc-toml',
      \ 'coc-texlab', 'coc-tailwindcss', 'coc-omnisharp',
      \ 'coc-prisma']

nmap <silent> [r <Plug>(coc-diagnostic-prev)
nmap <silent> ]r <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>c :<C-u>CocList commands<cr>

" Vim-Ale Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>aF :ALEFix<cr>
nnoremap <leader>aI :ALEInfo<cr>

" Open fzf search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-p> :FZF<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" ColorScheme Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("autocmd") && !has("gui_running"))
  augroup colors
    autocmd!
    let s:background = { "gui": "#282C34", "cterm": "235", "cterm16": "0" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:background })
  augroup END
endif

" Vim-Smooth-Scroll
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-u> :call smooth_scroll#up(&scroll, 5, 2)<cr>
nnoremap <silent> <C-d> :call smooth_scroll#down(&scroll, 5, 2)<cr>
nnoremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 5, 4)<cr>
nnoremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 5, 4)<cr>

" Porting in zshrc aliases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND = 'ag -g "" '
