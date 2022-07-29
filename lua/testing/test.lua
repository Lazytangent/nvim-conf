local windows = vim.api.nvim_list_wins()
local current_win = vim.api.nvim_get_current_win()

for _, win in ipairs(windows) do
  if win ~= current_win then
    vim.api.nvim_set_current_win(win)
    break
  end
end
