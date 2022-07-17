local lsp = require('lspconfig')
local capabilities = require('lsp.capabilities')

lsp.elixirls.setup {
  cmd = { "elixir-ls" },
  capabilities = capabilities,
}
