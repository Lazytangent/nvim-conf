local capabilities = require('lsp.capabilities')

capabilities.offsetEncoding = 'utf-16'

-- @type vim.lsp.Config
return {
  capabilities = capabilities,
}
