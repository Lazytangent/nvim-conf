local M = {}

local default_buffer_opts = {
  listed = false,
  scratch = false,
  swapfile = false,
  buftype = "nofile",
  bufhidden = "wipe",
}

---@param name string
---@param opts? table
---@return table table {number: number, new: boolean}
M.get_or_create_buffer_by_name = function(name, opts)
  local opts = opts or {}
  opts = vim.tbl_deep_extend("force", default_buffer_opts, opts)

  local buffer = nil
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local buffer_name = vim.api.nvim_buf_get_name(bufnr)
    if buffer_name:find(name) ~= nil then
      return { number = bufnr, new = false }
    end
  end

  buffer = vim.api.nvim_create_buf(opts.listed, opts.scratch)
  vim.api.nvim_buf_set_name(buffer, name)
  for key, value in pairs(opts) do
    if key ~= "listed" and key ~= "scratch" then
      vim.api.nvim_set_option_value(key, value, { buf = buffer })
    end
  end

  return { number = buffer, new = true }
end

M.open_file_action = function()
  local matches = require("mini.pick").get_picker_matches()
  local current_match = matches.current

  local filename = ""
  if current_match ~= nil and current_match ~= "" then
    filename = current_match
  else
    local query = require("mini.pick").get_picker_query()
    filename = table.concat(query)
  end

  vim.api.nvim_win_call(require("mini.pick").get_picker_state().windows.target, function()
    vim.cmd("edit " .. filename)
  end)
  return true
end

M.get_python_path = function(workspace)
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
end

return M
