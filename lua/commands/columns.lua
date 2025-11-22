vim.api.nvim_create_user_command("Columns", function()
  local current_foldcolumn = vim.opt_local.foldcolumn:get()
  vim.opt_local.foldcolumn = current_foldcolumn == '0' and '3' or '0'

  local current_signcolumn = vim.opt_local.signcolumn:get()
  vim.opt_local.signcolumn = current_signcolumn == 'no' and 'auto' or 'no'
end, {})
