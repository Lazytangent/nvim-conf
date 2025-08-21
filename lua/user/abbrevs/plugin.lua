local Buffer = require('user.lib.buffer')

local M = {}
local buffer

-- create buffer
M.create_abbrev_buffer = function()
  buffer = Buffer.create {
    name = "Abbrevs",
    kind = "split_below",
    modifiable = true,
  }
  return buffer
end

-- remove buffer (and local abbrevs)
M.remove_abbrev_buffer = function()

end

-- apply abbrevs when leaving buffer (AutoCmd event?)
M.apply_abbrevs = function()
  local number_of_lines = vim.api.nvim_buf_line_count(buffer.handle)
  local lines = vim.api.nvim_buf_get_lines(buffer.handle, 0, number_of_lines, false)

  for _, line in ipairs(lines) do
    if #line ~= 0 then
      local split_idx = line:find(",")
      local short = line:sub(0, split_idx - 1)
      local long = line:sub(split_idx + 1)
      print(short, ":", long)
    end
  end

  print(vim.inspect(lines))
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
