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
  settings = {
    ty = {
      configuration = {
        environment = {},
      },
    },
  },
  on_init = function(client)
    client.settings.ty.configuration.environment.python = (function(workspace)
      if vim.env.VIRTUAL_ENV then
        return vim.fs.joinpath(vim.env.VIRTUAL_ENV, "bin", "python")
      end
      if workspace then
        local poetry_lock_path = vim.fs.joinpath(workspace, "poetry.lock")
        local pipfile_path = vim.fs.joinpath(workspace, "Pipfile")
        if vim.uv.fs_stat(poetry_lock_path) then
          local venv = vim.fn.trim(vim.fn.system "poetry env info -p")
          return vim.fs.joinpath(venv, "bin", "python")
        elseif vim.uv.fs_stat(pipfile_path) then
          local venv = vim.fn.trim(vim.fn.system "pipenv --venv")
          return vim.fs.joinpath(venv, "bin", "python")
        end
      end
      return vim.fn.exepath "python3" or vim.fn.exepath "python" or "python"
    end)(client.config.root_dir)
  end,
}
