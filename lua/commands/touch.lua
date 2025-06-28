vim.api.nvim_create_user_command("Touch", function(opts)
  local args = opts.args
  vim.cmd([[:!touch ]] .. args)
end, {
  nargs = "*",
})
