local on_attach = require('lsp.regular.on_attach')
local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
  on_attach = on_attach,
  capabilities = capabilities,
}
