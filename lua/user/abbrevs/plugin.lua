local M = {}
local buffer = -1
local window

-- create buffer
M.create_abbrev_buffer = function()
  if buffer == -1 then
    buffer = vim.api.nvim_create_buf(false, false)
    vim.api.nvim_buf_set_name(buffer, "Abbrevs")
    vim.api.nvim_set_option_value('swapfile', false, { buf = buffer })
    vim.api.nvim_set_option_value('buftype', 'nofile', { buf = buffer })
  end

  window = vim.api.nvim_open_win(buffer, true, {
    split = "below",
    height = 30,
  })

  vim.api.nvim_create_autocmd('BufLeave', {
    buffer = buffer,
    callback = function()
      M.apply_abbrevs()
    end,
  })
  return buffer
end

-- TODO: Better way to split short from long
-- TODO: Would prefer having two quote delimited strings instead, like lam

-- apply abbrevs when leaving buffer (AutoCmd event?)
M.apply_abbrevs = function()
  local number_of_lines = vim.api.nvim_buf_line_count(buffer)
  local lines = vim.api.nvim_buf_get_lines(buffer, 0, number_of_lines, false)

  for _, line in ipairs(lines) do
    if #line ~= 0 then
      local split_idx = line:find(",")
      if split_idx ~= nil then
        local short = line:sub(0, split_idx - 1)
        local long = line:sub(split_idx + 1)

        local cmd = "Abolish " .. short .. " " .. long
        vim.cmd(cmd)
      end
    end
  end
end

vim.api.nvim_create_user_command('Abbrevs',
  function(o)
    if #o.fargs == 0 then
      M.create_abbrev_buffer()
      return
    end

    M[o.fargs[1]]()
  end, {
    nargs = "*",
    complete = function(arglead)
      return vim.tbl_filter(function(arg)
        return arg:match("^" .. arglead)
      end, {
        "apply_abbrevs",
        "create_abbrev_buffer",
      })
    end,
  }
)

return M
