local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
  capabilities = capabilities,
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
      },
    },
  },
}
