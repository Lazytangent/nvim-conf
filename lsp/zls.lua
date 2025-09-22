local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
  capabilities = capabilities,
  settings = {
    zls = {
      zig_exe_path = vim.fn.expand("~/") .. ".local/bin/zigm",
    },
  },
}
