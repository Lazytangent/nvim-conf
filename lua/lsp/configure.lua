local primary_on_attach = require("lsp.primary.on_attach")
local regular_on_attach = require("lsp.regular.on_attach")
local capabilities = require("lsp.capabilities")
local LSP = require("config").LSP

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local regular_servers = LSP.servers.regular
local primary_servers = LSP.servers.primary

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  update_in_insert = false,
}

for _, lsp in ipairs(primary_servers) do
  vim.lsp.config(lsp, {
    on_attach = primary_on_attach,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end

for _, lsp in ipairs(regular_servers) do
  vim.lsp.config(lsp, {
    on_attach = regular_on_attach,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end
