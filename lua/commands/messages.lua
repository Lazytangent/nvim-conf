local utils = require('user.utils')

local name = "Messages"
vim.api.nvim_create_user_command(name, function ()
  local buf = utils.get_or_create_buffer_by_name(name)

  if buf.new then
    vim.api.nvim_open_win(buf.number, true, {
      split = "below",
    })
  end

  local content = vim.api.nvim_exec2('messages', { output = true })

  if content == nil then
    return
  end

  local lines = {}
  for line in content.output:gmatch("(.-)\n") do
    table.insert(lines, line)
  end

  vim.api.nvim_buf_set_lines(buf.number, 0, -1, false, lines)
end, {})
