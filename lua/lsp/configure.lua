local LSP = require("config").LSP

vim.diagnostic.config {
  virtual_text = LSP.virtual_text,
  signs = true,
  update_in_insert = false,
}

-- group, list
for _, list in pairs(LSP.servers) do
  vim.lsp.enable(list)
end
