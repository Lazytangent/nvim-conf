return {
  {
    "heavenshell/vim-jsdoc",
    build = "make install",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
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
    config = function()
      require 'extensions.languages.configs.vimtex'
    end,
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
    opts = {
      textobjects = false,
      luasnip = true,
      lsp_inlay_hints = {
        enable = false,
      },
    },
  },
  { "b0o/schemastore.nvim", ft = { "json", "yaml" } },
  { "carbon-language/vim-carbon-lang", ft = "carbon" },
  { "keith/swift.vim", ft = "swift" },
  { "mrdotb/vim-tailwindcss", ft = { "css", "javascript", "typescript", "javascriptreact", "typescriptreact" } },
  {
    "nvim-orgmode/orgmode.nvim",
    config = function()
      require 'extensions.languages.configs.orgmode'
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require 'extensions.languages.configs.rust-tools'
    end,
  },
  { "tami5/swift.nvim", ft = "swift", main = "swift_env", opts = require "extensions.languages.configs.swift" },
  { "mfussenegger/nvim-jdtls" },
  { "vim-scripts/groovyindent-unix", ft = "groovy" },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "SmiteshP/nvim-navic" },
    opts = {
      settings = {
        expose_as_code_action = 'all',
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    }
  },
  {
    "mrcjkb/haskell-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    branch = "1.x.x",
  },
  {
    "sealemar/vtl",
  },
  { "tpope/vim-cucumber" },
  "alaviss/nim.nvim",
}
