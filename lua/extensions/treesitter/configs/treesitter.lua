local Treesitter = require("config").Treesitter

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

require('nvim-treesitter').install(Treesitter.languages)

-- vim.treesitter.language.add(
--   'texinfo',
--   {
--     path = vim.fn.expand "~/.local/src/projects/tree-sitter-texinfo/texinfo.so",
--   }
-- )

-- Custom languages
vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').ghactions = {
      install_info = {
        url = 'https://github.com/rmuir/tree-sitter-ghactions',
        queries = 'queries',
      },
    }
  end,
})
