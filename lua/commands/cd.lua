vim.api.nvim_create_user_command("Cd", "cd %:h", {})
vim.api.nvim_create_user_command("Lcd", "lcd %:h", {})
