-- @type vim.lsp.Config
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
}
