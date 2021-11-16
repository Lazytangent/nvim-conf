local lsp = require('lspconfig')
local capabilities = require('lsp.capabilities')

lsp.sqlls.setup {
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  capabilities = capabilities,
}
