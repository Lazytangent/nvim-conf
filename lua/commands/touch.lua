vim.api.nvim_create_user_command("Touch", function(opts)
  args = opts.args
  vim.cmd([[:!touch ]] .. args)
end, {
  nargs = "*",
})
