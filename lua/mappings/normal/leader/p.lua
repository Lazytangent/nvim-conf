local telescope = require 'telescope.builtin'

return {
  { "<leader>pd",  group = "Diagnostics" },
  { "<leader>pdd", telescope.lsp_document_diagnostics,  desc = "Document" },
  { "<leader>pdw", telescope.lsp_workspace_diagnostics, desc = "Workspace" },
}
