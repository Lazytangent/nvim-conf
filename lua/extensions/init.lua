local lazy = require('lazy')

local lazy_opts = {
  concurrency = 50,
  dev = {
    path = "~/.local/src/neovim-plugins",
  },
}

-- Theme Stuff
local theme_stuff = {
  "folke/tokyonight.nvim",
  "nvim-lualine/lualine.nvim",
  'navarasu/onedark.nvim',
  'B4mbus/oxocarbon-lua.nvim',
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
}

-- Treesitter
local treesitter = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "nvim-treesitter/nvim-treesitter-refactor",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-context",

  "JoosepAlviste/nvim-ts-context-commentstring",
  "RRethy/nvim-treesitter-endwise",
  "HiPhish/nvim-ts-rainbow2",
  "theHamsta/nvim-treesitter-pairs",
  "windwp/nvim-ts-autotag",
  "phelipetls/jsonpath.nvim",
  "yioneko/nvim-yati",
  "yioneko/vim-tmindent",
  {
    "Lazytangent/nvim-gps",
    dev = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  },
}

-- LSP
local lsp = {
  "L3MON4D3/LuaSnip",
  "neovim/nvim-lspconfig",
  "rafamadriz/friendly-snippets",
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },

  -- nvim-cmp
  "f3fora/cmp-spell",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-calc",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-omni",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",
  "kdheepak/cmp-latex-symbols",
  "lukas-reineke/cmp-rg",
  "lukas-reineke/cmp-under-comparator",
  "onsails/lspkind-nvim",
  "ray-x/cmp-treesitter",
  "saadparwaiz1/cmp_luasnip",
  {
    "RishabhRD/nvim-lsputils",
    dependencies = { "RishabhRD/popfix" },
  },
  {
    'Saecki/crates.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require('lsp-inlayhints').setup()

      vim.cmd("highlight link LspInlayHint Comment")
    end,
  },
}

-- DAP
local dap = {
  "mfussenegger/nvim-dap",
  "mfussenegger/nvim-dap-python",
  "theHamsta/nvim-dap-virtual-text",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
  },
}

-- Specific Language Plugins
local languages = {
  {
    "heavenshell/vim-jsdoc",
    build = "make install",
  },
  {
    "pantharshit00/vim-prisma",
    ft = "prisma",
  },
  {
    "jidn/vim-dbml",
    ft = "dbml",
  },
  {
    "lervag/vimtex",
    ft = "tex",
  },
  {
    "digitaltoad/vim-pug",
    ft = "pug",
  },
  {
    "elixir-editors/vim-elixir",
    ft = "elixir",
  },
  {
    "fladson/vim-kitty",
    ft = "kitty",
  },
  {
    "hashivim/vim-terraform",
    ft = "terraform",
  },
  {
    "ray-x/go.nvim",
    ft = "go",
    config = function(_plugin, _opts)
      require('go').setup({ textobjects = false, luasnip = true })
    end,
  },
  "b0o/schemastore.nvim",
  "carbon-language/vim-carbon-lang",
  "keith/swift.vim",
  "mrdotb/vim-tailwindcss",
  "nvim-orgmode/orgmode.nvim",
  "simrat39/rust-tools.nvim",
  "tami5/swift.nvim",
  "mfussenegger/nvim-jdtls",
  "vim-scripts/groovyindent-unix",
}

-- Quality of Life Improvements
local qol = {
  "kdheepak/lazygit.nvim",
  --[[ "nathom/filetype.nvim", ]]
  "AckslD/nvim-FeMaco.lua",
  "gaoDean/autolist.nvim",
  "monaqa/dial.nvim",
  "hkupty/iron.nvim",
  "simrat39/symbols-outline.nvim",
}

-- Dadbod
local dadbod = {
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",
  "kristijanhusak/vim-dadbod-completion",
}

-- Telescope
local telescope = {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "tami5/sqlite.lua" },
  },
  "nvim-telescope/telescope-dap.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-project.nvim",
  "benfowler/telescope-luasnip.nvim",
}

local more_qol = {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "ggandor/leap.nvim",
    config = function(_plugin, _opts)
      require('leap').add_default_mappings()
    end,
  },
  "andymass/vim-matchup",
  "dhruvasagar/vim-table-mode",
  "ggandor/leap-ast.nvim",
  "j-hui/fidget.nvim",
  "kyazdani42/nvim-web-devicons",
  "lukas-reineke/indent-blankline.nvim",
  "mattn/emmet-vim",
  "natecraddock/workspaces.nvim",
  "numToStr/Comment.nvim",
  "pianocomposer321/yabs.nvim",
  "ryanoasis/vim-devicons",
  --[[ "sindrets/diffview.nvim", ]]
  "windwp/nvim-autopairs",

  -- Folke Section
  "folke/lsp-colors.nvim",
  "folke/todo-comments.nvim",
  "folke/trouble.nvim",
  "folke/which-key.nvim",

  -- Tpope Section
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "tpope/vim-unimpaired",

  -- Testing
  {
    "rcarriga/neotest",
    dependencies = { "antoinemadec/FixCursorHold.nvim" },
  },
  "rcarriga/neotest-plenary",
  "rcarriga/neotest-python",
  "rcarriga/neotest-vim-test",
  "vim-test/vim-test",
  "haydenmeade/neotest-jest",
  "rouge8/neotest-rust",

  "jondkinney/dragvisuals.vim",
  "junegunn/vim-easy-align",
  "norcalli/nvim-terminal.lua",
  "tversteeg/registers.nvim",
  "wellle/targets.vim",
  'kyazdani42/nvim-tree.lua',
  "pwntester/octo.nvim",
  "stevearc/oil.nvim",
}

-- Custom fixes for recent problems
local custom = {
  "Lazytangent/nvim-surround",
}

local plugins = {
  theme_stuff,
  treesitter,
  lsp,
  dap,
  languages,
  qol,
  dadbod,
  telescope,
  more_qol,
  custom,
}

lazy.setup(plugins, lazy_opts)

local extensions = require("config").Extensions

for _, extension in ipairs(extensions) do
  require("extensions." .. extension)
end
