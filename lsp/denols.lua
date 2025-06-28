local on_attach = require 'lsp.primary.on_attach'
local capabilities = require 'lsp.capabilities'

-- @type vim.lsp.Config
return {
  autostart = false,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = {"deno.json", "deno.jsonc"},
}
