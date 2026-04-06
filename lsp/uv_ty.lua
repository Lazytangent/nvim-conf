local get_python_path = require('user.utils').get_python_path

---@type vim.lsp.Config
return {
  cmd = { 'uvx', '--native-tls', 'ty', 'server' },
  filetypes = {
    'python',
  },
  root_markers = {
    'Pipfile',
    'Pipfile.lock',
    'pyproject.toml',
    'requirements.txt',
    '.git',
  },
  settings = {
    ty = {
      configuration = {
        environment = {},
      },
    },
  },
  on_init = function(client)
    client.settings.ty.configuration.environment.python = get_python_path(client.config.root_dir)
  end,
}
