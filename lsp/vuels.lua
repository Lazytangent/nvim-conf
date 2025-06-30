local on_attach = require('lsp.primary.on_attach')
local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    config = {
      vetur = {
        completion = {
          autoImport = true,
          useScaffoldSnippets = true,
        },
        format = {
          defaultFormatter = {
            js = "prettier",
            ts = "pretter",
          },
        },
      },
    },
  }
}
