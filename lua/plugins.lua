return require("packer").startup(
  function()
    -- Packer.nvim
    use "wbthomason/packer.nvim"

    -- Theme Stuff
    use {
      'hoob3rt/lualine.nvim',
      'joshdick/onedark.vim',
      'lewis6991/moonlight.vim',
    }

    -- Formatting && General LSP
    use {
      { 'prettier/vim-prettier', run = 'yarn install' },
      { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'mattn/emmet-vim',
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-compe',
    }

    -- Specific Language Plugins
    use {
      { 'heavenshell/vim-jsdoc', run = 'make install' },
      'pantharshit00/vim-prisma',
      'leafgarland/typescript-vim',
      'peitalin/vim-jsx-typescript',
      'maxmellon/vim-jsx-pretty',
      'yuezk/vim-js',
      'instant-markdown/vim-instant-markdown',
      'plasticboy/vim-markdown',
      'mrdotb/vim-tailwindcss',
      'nvie/vim-flake8',
      'jmcantrell/vim-virtualenv',
      'jidn/vim-dbml',
      'lervag/vimtex',
    }

    -- Quality of Life Improvements
    use {
      { 'mg979/vim-visual-multi', branch = 'master' },
      { 'tanvirtin/vgit.nvim', requires = 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} },
       'lukas-reineke/indent-blankline.nvim',
      'p00f/nvim-ts-rainbow',
      'kyazdani42/nvim-web-devicons',
      'ryanoasis/vim-devicons',
      'folke/lsp-colors.nvim',
      'folke/trouble.nvim',
      'folke/which-key.nvim',
      -- 'vimwiki/vimwiki',
      -- 'nvim-lua/popup.nvim',
      -- 'nvim-lua/plenary.nvim',
      'xolox/vim-misc',
      'xolox/vim-easytags',
      'preservim/tagbar',
      'jondkinney/dragvisuals.vim',
      'kyazdani42/nvim-tree.lua',
      'junegunn/fzf.vim',
      'jiangmiao/auto-pairs',
      -- 'windwp/nvim-autopairs',
      'kristijanhusak/orgmode.nvim',

      -- Tpope Section
      'tpope/vim-commentary',
      'tpope/vim-surround',
      'tpope/vim-repeat',
      'tpope/vim-fugitive',
      'tpope/vim-eunuch',
      'tpope/vim-dadbod',
      'tpope/vim-heroku',
      'tpope/vim-dotenv',
      'tpope/vim-ragtag',
      'tpope/vim-unimpaired',

      'alvan/vim-closetag',
      'justinmk/vim-sneak',
      'pwntester/octo.nvim',
      -- 'karb94/neoscroll.nvim',
      'psliwka/vim-smoothie',
      'kana/vim-textobj-user',
      'kana/vim-textobj-line',
      'christoomey/vim-sort-motion',
      'michaeljsmith/vim-indent-object',
      'vim-test/vim-test',
      'famiu/nvim-reload',
    }
  end
)
