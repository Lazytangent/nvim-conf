vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.antigenrc",
  command = "set filetype=zsh"
})
