local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.offsetEncoding = 'utf-16'

-- @type vim.lsp.Config
return {
  capabilities = capabilities,
}
