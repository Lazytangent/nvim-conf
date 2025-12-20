local capabilities = require 'lsp.capabilities'

-- @type vim.lsp.Config
return {
  autostart = false,
  capabilities = capabilities,
  root_dir = {"deno.json", "deno.jsonc"},
}
