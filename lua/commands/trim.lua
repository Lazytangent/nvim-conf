vim.api.nvim_create_user_command("Trim", "%s/\\s\\+$//e", {})
vim.api.nvim_create_user_command("TrimNL", "%s/\\n\\+\\%$//e", {})
