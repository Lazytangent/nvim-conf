local telescope = require 'telescope.builtin'

return {
  { "<leader>l",  group = "LSP" },
  { "<leader>la", desc = "Code action" },                  -- via LSP on_attach
  { "<leader>lc", telescope.lsp_code_actions,              desc = "at Cursor" },
  { "<leader>lr", telescope.lsp_range_code_actions,        desc = "on Range" },
  { "<leader>ls", telescope.lsp_document_symbols,          desc = "Document" },
  { "<leader>lS", telescope.lsp_workspace_symbols,         desc = "Workspace" },
  { "<leader>lw", telescope.lsp_dynamic_workspace_symbols, desc = "Dynamic workspace" },
  { "<leader>lt", telescope.lsp_type_definitions,          desc = "Type Definitions" },
}
