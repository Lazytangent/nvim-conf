vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.antigenrc",
  callback = function()
    vim.bo.filetype = "zsh"
  end,
})
