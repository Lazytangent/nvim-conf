local lsp = require('lspconfig')
local capabilities = require('lsp.capabilities')

lsp.elixirls.setup {
  cmd = { "elixirls" },
  capabilities = capabilities,
}
