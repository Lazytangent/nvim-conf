" Disable ALE's LSP to use CoC
let g:ale_disable_lsp = 1

" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin("~/.config/nvim/plugged")
  " Plugin Section
  " Themes
  Plug 'hoob3rt/lualine.nvim'
  Plug 'joshdick/onedark.vim'
  Plug 'lewis6991/moonlight.vim'

  " Languages/Syntax
  Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
  Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> coc#util#install() } }
  Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'json', 'markdown', 'yaml', 'html', 'python']
    \ }
  " Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale'
  Plug 'mattn/emmet-vim'
  Plug 'pantharshit00/vim-prisma'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'lewis6991/spellsitter.nvim'

  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'yuezk/vim-js'
  Plug 'heavenshell/vim-jsdoc', {
    \ 'for': ['javascript', 'javascript.jsx', 'typescript'],
    \ 'do': 'make install'
    \}
  Plug 'instant-markdown/vim-instant-markdown'
  Plug 'plasticboy/vim-markdown'
  Plug 'mrdotb/vim-tailwindcss'
  Plug 'nvie/vim-flake8'
  Plug 'jmcantrell/vim-virtualenv'

  " General Use
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'
  Plug 'folke/lsp-colors.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'axvr/org.vim'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-easytags'
  Plug 'preservim/tagbar'
  Plug 'lervag/vimtex'
  Plug 'jondkinney/dragvisuals.vim'
  Plug 'scrooloose/nerdtree'
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
  Plug 'psliwka/vim-smoothie'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-line'
  Plug 'christoomey/vim-sort-motion'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'vim-test/vim-test'

call plug#end()

" Folke plugins
lua << EOF
require("trouble").setup {}
require("which-key").setup {}
require('key-mappings')
require("lsp-colors").setup {}
EOF

" Lualine
lua << EOF
require('lualine').setup {
  options = {
    theme = "nightfly",
  },
  sections = {
    lualine_c = {{ 'filename', file_status = true, path = 1 }, 'diff'},
    lualine_z = {'location', { 'diagnostics', sources = {'nvim_lsp', 'coc', 'ale'}, sections = {'error', 'warn', 'info'} }},
  },
}
EOF

" Neovim-LSP
lua << EOF
require'lspconfig'.clangd.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vimls.setup{}
EOF

" Tree-Sitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  ignore_install = {},
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
    disable = {},
  },
}
EOF

" Spell-Sitter
lua << EOF
EOF

" Nvim Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" Indent-Blankline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_blankline_char = "▏"
let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:indent_blankline_show_first_indent_level = v:false

" Vim-Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

" Vim-Instant-Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 0
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_autoscroll = 1
nmap <leader>md :InstantMarkdownPreview<cr>
nmap <leader>ms :InstantMarkdownStop<cr>

" Drag Visuals
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DVB_TrimWS = 1

vmap <expr> <S-H> DVB_Drag('left')
vmap <expr> <S-L> DVB_Drag('right')
vmap <expr> <S-J> DVB_Drag('down')
vmap <expr> <S-K> DVB_Drag('up')

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
      \ 'typescript': ['prettier', 'eslint'],
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

" Vim-Smooth-Scroll
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <silent> <C-u> :call smooth_scroll#up(&scroll, 5, 2)<cr>
" nnoremap <silent> <C-d> :call smooth_scroll#down(&scroll, 5, 2)<cr>
" nnoremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 5, 4)<cr>
" nnoremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 5, 4)<cr>
let g:smoothie_experimental_mappings = v:true

" Porting in zshrc aliases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND = 'ag -g "" '
