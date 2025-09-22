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
  capabilities = capabilities,
}
