local lsp = require('lspconfig')
local capabilities = require('lsp.capabilities')
local on_attach = require('lsp.regular.on_attach')

lsp.sqlls.setup {
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  capabilities = capabilities,
  on_attach = on_attach,
}
