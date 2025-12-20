local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.offsetEncoding = 'utf-16'

-- @type vim.lsp.Config
return {
  capabilities = capabilities,
}
