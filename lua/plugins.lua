return require("packer").startup(
  function()
    use "wbthomason/packer.nvim"

    use 'hoob3rt/lualine.nvim'
    use 'joshdick/onedark.vim'
    use 'lewis6991/moonlight.vim'

    use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
    use { 'neoclide/coc.nvim', branch = "release", run = function() vim.fn['coc#util#install']() end }
    use { 'prettier/vim-prettier', run = 'yarn install' }
    use 'dense-analysis/ale'
    use 'mattn/emmet-vim'
    use 'pantharshit00/vim-prisma'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'neovim/nvim-lspconfig'

    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use 'maxmellon/vim-jsx-pretty'
    use 'yuezk/vim-js'
    use { 'heavenshell/vim-jsdoc', cmd = 'make install', ft = {'js', 'jsx', 'ts', 'tsx'} }
    use 'instant-markdown/vim-instant-markdown'
    use 'plasticboy/vim-markdown'
    use 'mrdotb/vim-tailwindcss'
    use 'nvie/vim-flake8'
    use 'jmcantrell/vim-virtualenv'
    
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'
    use 'folke/lsp-colors.nvim'
    use 'folke/trouble.nvim'
    use 'folke/which-key.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'axvr/org.vim'
    use 'xolox/vim-misc'
    use 'xolox/vim-easytags'
    use 'preservim/tagbar'
    use 'lervag/vimtex'
    use 'jondkinney/dragvisuals.vim'
    use 'scrooloose/nerdtree'
    use 'junegunn/fzf.vim'
    use 'jiangmiao/auto-pairs'
    use { 'mg979/vim-visual-multi', branch = 'master' }
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-dadbod'
    use 'tpope/vim-heroku'
    use 'tpope/vim-dotenv'
    use 'psliwka/vim-smoothie'
    use 'kana/vim-textobj-user'
    use 'kana/vim-textobj-line'
    use 'christoomey/vim-sort-motion'
    use 'michaeljsmith/vim-indent-object'
    use 'vim-test/vim-test'
  end
)
