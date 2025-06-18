local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

local lsp = 'gopls'

vim.lsp.config(lsp, {
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
})
vim.lsp.enable(lsp)
