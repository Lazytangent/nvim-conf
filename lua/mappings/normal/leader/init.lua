local telescope = require 'telescope.builtin'

local parent_module = (...):match("(.-)[^%.]+$")
local current_module = parent_module .. 'leader.'

return {
  { "<leader>,",  group = "Utilities" },
  { "<leader>,*", "*<C-O>:%s///gn<cr>",  desc = "Count matches" },

  { "<leader>,,", "<C-^>", desc = "Prev buffer" },
  { "<leader>`",  "<C-^>", desc = "Prev buffer" },

  { "<leader>,d",  group = "Diagnostics" },
  { "<leader>,dh", vim.diagnostic.hide,                 desc = "Hide diagnostics in buffer" },
  { "<leader>,ds", vim.diagnostic.show,                 desc = "Show diagnostics in buffer" },
  { "<leader>,f",  function() vim.lsp.buf.format() end, desc = "Format" },

  { "<leader>/",  telescope.current_buffer_fuzzy_find,  desc = "Search current buffer" },

  { "<leader><Enter>", desc = "Org: Meta Return" }, -- Only in Orgmode

  { "<leader>e", desc = "Show line diagnostics" },
  { "<leader>q", desc = "Set diagnostics into location list" }, -- Set via LSP on_attach

  require(current_module .. 'leader'),
  require(current_module .. 'd'),
  require(current_module .. 'f'),
  require(current_module .. 'g'),
  require(current_module .. 'h'),
  require(current_module .. 'l'),
  require(current_module .. 'n'),
  require(current_module .. 'o'),
  require(current_module .. 'p'),
  require(current_module .. 't'),
  require(current_module .. 'x'),
}
