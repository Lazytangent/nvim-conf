local capabilities = require('lsp.capabilities')
local get_python_path = require('user.utils').get_python_path

-- @type vim.lsp.Config
return {
  capabilities = capabilities,
  settings = {
    python = {},
  },
  on_init = function(client)
    client.settings.python.pythonPath = get_python_path(client.config.root_dir)
  end,
}
