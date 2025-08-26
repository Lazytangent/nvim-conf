local M = {}

local default_buffer_opts = {
  listed = false,
  scratch = false,
  swapfile = false,
  buftype = 'nofile',
  bufhidden = 'wipe',
}

---@param name string
---@param opts? table
---@return table table {number: number, new: boolean}
M.get_or_create_buffer_by_name = function(name, opts)
  local opts = opts or {}
  opts = vim.tbl_deep_extend('force', default_buffer_opts, opts)

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
    if key ~= 'listed' and key ~= 'scratch' then
      vim.api.nvim_set_option_value(key, value, { buf = buffer })
    end
  end

  return { number = buffer, new = true }
end

return M
