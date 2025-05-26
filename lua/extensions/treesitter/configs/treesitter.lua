local Treesitter = require("config").Treesitter

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

require('nvim-treesitter').install(Treesitter.parsers)
