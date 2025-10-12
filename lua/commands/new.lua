local function slice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced+1] = tbl[i]
  end

  return sliced
end

vim.api.nvim_create_user_command("New", function(opts)
  local args = opts.fargs
  local filetype = args[1]

  local buffer = vim.api.nvim_create_buf(false, false)
  vim.api.nvim_buf_set_name(buffer, filetype .. '-temp')
  vim.api.nvim_set_option_value('swapfile', false, { buf = buffer })
  vim.api.nvim_set_option_value('buftype', 'nofile', { buf = buffer })
  vim.api.nvim_set_option_value('filetype', filetype, { buf = buffer })

  vim.api.nvim_open_win(buffer, true, {
    split = "below",
  })

  -- Set other options with `setlocal` after moving focus to new split/window
  for _, thing in ipairs(slice(args, 2)) do
    vim.cmd("setlocal " .. thing)
  end

  vim.api.nvim_create_autocmd('BufLeave', {
    buffer = buffer,
    callback = function()
      local number_of_lines = vim.api.nvim_buf_line_count(buffer)
      local lines = vim.api.nvim_buf_get_lines(buffer, 0, number_of_lines, false)
      -- Set clipboard register: "unnamedplus"
      vim.fn.setreg("+", lines)
    end,
  })
end, {
  nargs = '+',
  complete = 'filetype',
})
