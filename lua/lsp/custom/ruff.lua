local lsp = require('lspconfig')
local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

lsp.ruff.setup {
  init_options = {
    settings = {
      args = {
        -- TODO: Make this conditional? Or somehow configure a default line
        -- length of 120 globally
        "--ignore=E501",  -- Ignore line length complaints.
      }
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
