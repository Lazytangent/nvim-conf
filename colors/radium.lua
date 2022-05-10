vim.api.nvim_create_autocmd("User PackerComplete", {
  callback = function()
    require('colors.base46.base46').load_theme()
  end
})

vim.api.nvim_create_user_command("Radium", "colorscheme radium", {})
