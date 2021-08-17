require("packer").startup(function()
  -- Packer.nvim
  use("wbthomason/packer.nvim")

  -- Theme Stuff
  use({
    "hoob3rt/lualine.nvim",
    -- "lewis6991/moonlight.vim",
    "folke/tokyonight.nvim",
    "marko-cerovac/material.nvim",
    "shaunsingh/moonlight.nvim",
  })

  -- Formatting && General LSP
  use({
    { "prettier/vim-prettier", run = "yarn install" },
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "theHamsta/nvim-treesitter-pairs",
    "windwp/nvim-ts-autotag",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "mattn/emmet-vim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-compe",
    "L3MON4D3/LuaSnip",
  })

  -- Specific Language Plugins
  use({
    { "heavenshell/vim-jsdoc", run = "make install" },
    "pantharshit00/vim-prisma",
    "leafgarland/typescript-vim",
    "peitalin/vim-jsx-typescript",
    "maxmellon/vim-jsx-pretty",
    "yuezk/vim-js",
    "instant-markdown/vim-instant-markdown",
    "plasticboy/vim-markdown",
    "mrdotb/vim-tailwindcss",
    "nvie/vim-flake8",
    "jmcantrell/vim-virtualenv",
    "jidn/vim-dbml",
    "lervag/vimtex",
  })

  -- Quality of Life Improvements
  use({
    { "mg979/vim-visual-multi", branch = "master" },
    { "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } },
    {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("null-ls").config({})
        require("lspconfig")["null-ls"].setup({})
      end,
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    },
    "andymass/vim-matchup",
    "lukas-reineke/indent-blankline.nvim",
    "p00f/nvim-ts-rainbow",
    "kyazdani42/nvim-web-devicons",
    "ryanoasis/vim-devicons",

    -- Folke Section
    "folke/lsp-colors.nvim",
    "folke/trouble.nvim",
    "folke/which-key.nvim",
    "folke/zen-mode.nvim",
    "folke/todo-comments.nvim",
    "tversteeg/registers.nvim",
    "itmecho/neoterm.nvim",
    "ludovicchabant/vim-gutentags",
    "preservim/tagbar",
    'kyazdani42/nvim-tree.lua',
    -- "preservim/nerdtree",
    "jondkinney/dragvisuals.vim",
    "junegunn/fzf.vim",
    "jiangmiao/auto-pairs",
    "kristijanhusak/orgmode.nvim",
    "mileszs/ack.vim",

    -- Tpope Section
    "tpope/vim-commentary",
    "tpope/vim-surround",
    "tpope/vim-dispatch",
    "tpope/vim-repeat",
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "tpope/vim-eunuch",
    "tpope/vim-dadbod",
    "tpope/vim-heroku",
    "tpope/vim-dotenv",
    "tpope/vim-ragtag",
    "tpope/vim-unimpaired",

    -- "ahmedkhalf/project.nvim",
    "alvan/vim-closetag",
    "justinmk/vim-sneak",
    "pwntester/octo.nvim",
    "psliwka/vim-smoothie",
    "kana/vim-textobj-user",
    "kana/vim-textobj-line",
    "christoomey/vim-sort-motion",
    "michaeljsmith/vim-indent-object",
    "vim-test/vim-test",
  })
end)

require "plugins.general"
