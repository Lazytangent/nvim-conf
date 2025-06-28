local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

capabilities.offsetEncoding = 'utf-16'

-- @type vim.lsp.Config
return {
  on_attach = on_attach,
  capabilities = capabilities,
}
