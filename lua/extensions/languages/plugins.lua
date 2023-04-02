return {
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
    config = function()
      require 'extensions.languages.configs.vimtex'
    end
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
    opts = { textobjects = false, luasnip = true },
  },
  { "b0o/schemastore.nvim", ft = { "json", "yaml" } },
  { "carbon-language/vim-carbon-lang", ft = "carbon" },
  { "keith/swift.vim", ft = "swift"},
  "mrdotb/vim-tailwindcss",
  {
    "nvim-orgmode/orgmode.nvim",
    ft = "org",
    config = function()
      require 'extensions.languages.configs..orgmode'
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      require 'extensions.languages.configs.rust-tools'
    end,
  },
  { "tami5/swift.nvim", ft = "switft", main = "swift_env", opts = require("extensions.swift") },
  { "mfussenegger/nvim-jdtls", ft = "java" },
  { "vim-scripts/groovyindent-unix", ft = "groovy" },
}
