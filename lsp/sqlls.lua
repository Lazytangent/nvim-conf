local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  capabilities = capabilities,
}
