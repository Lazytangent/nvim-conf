-- @type vim.lsp.Config
return {
  cmd = { 'uvx', 'ty', 'server' },
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
