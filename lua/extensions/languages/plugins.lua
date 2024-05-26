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
    "mrcjkb/rustaceanvim",
    config = function()
      require 'extensions.languages.configs.rust'
    end,
  },
  { "tami5/swift.nvim", ft = "swift", main = "swift_env", opts = require "extensions.languages.configs.swift" },
  {
    "mfussenegger/nvim-jdtls",
    event = "VeryLazy",
  },
  { "vim-scripts/groovyindent-unix", ft = "groovy" },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "SmiteshP/nvim-navic" },
    opts = {
      on_attach = require('lsp.primary.on_attach'),
      settings = {
        expose_as_code_action = {
          "fix_all",
          "add_missing_imports",
          "remove_unused",
        },
      },
    },
    event = "VeryLazy",
  },
  {
    "sealemar/vtl",
    event = "VeryLazy",
  },
  {
    "alaviss/nim.nvim",
    event = "VeryLazy",
  },
  {
    "aklt/plantuml-syntax",
    event = "VeryLazy",
  },
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
  },
  {
    "towolf/vim-helm",
    ft = "helm",
  },
}
