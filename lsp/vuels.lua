local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
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
