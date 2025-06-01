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
  print(filetype)
  vim.cmd("new")
  vim.cmd("set filetype=" .. filetype)
  for _, thing in ipairs(slice(args, 2)) do
    vim.cmd("setlocal " .. thing)
  end
end, {
  nargs = '+',
})
