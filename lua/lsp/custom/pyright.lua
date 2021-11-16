local util = require('lspconfig/util')
local on_attach = require('lsp.on_attach')
local capabilities = require('lsp.capabilities')
local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv from pipenv in workspace directory
  local match = vim.fn.glob(path.join(workspace, 'Pipfile'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv'))
    return path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

require('lspconfig').pyright.setup {
  on_attach = on_attach,
  on_init = function(client)
    client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
  end,
}
