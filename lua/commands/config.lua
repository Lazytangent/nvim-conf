vim.api.nvim_create_user_command("Config", function(args)
  vim.cmd [[call FugitiveDetect(expand("~/.cfg"))]]
  vim.cmd [[Git]]
end, {})
