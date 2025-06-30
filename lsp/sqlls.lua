local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  capabilities = capabilities,
  on_attach = on_attach,
}
