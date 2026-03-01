local capabilities = require('lsp.capabilities')

-- @type vim.lsp.Config
return {
  capabilities = capabilities,
  -- Initial attempt at setting pythonPath for lsp
  -- TODO: Test cases
  -- - uv venv
  -- - poetry venv
  -- - pipenv venv
  -- - manual python -m venv
  settings = {
    python = {},
  },
  on_init = function(client)
    vim.print(client)
    client.settings.python.pythonPath = (function(workspace)
      if vim.env.VIRTUAL_ENV then
        return vim.fs.joinpath(vim.env.VIRTUAL_ENV, "bin", "python")
      end
      if workspace then
        local poetry_lock_path = vim.fs.joinpath(workspace, "poetry.lock")
        if vim.uv.fs_stat(poetry_lock_path) then
          local venv = vim.fn.trim(vim.fn.system "poetry env info -p")
          return vim.fs.joinpath(venv, "bin", "python")
        end
        -- TODO: What about pipenv?
      end
      return vim.fn.exepath "python3" or vim.fn.exepath "python" or "python"
    end)(client.config.root_dir)
  end,
}
