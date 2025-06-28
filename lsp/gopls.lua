local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
  cmd = { "gopls", "serve" },
  settings = {
    gopls = {
      analyses = {
        unusuedparams = true,
      },
      staticcheck = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
