vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.zshrc",
  command = "setlocal filetype=zsh",
})
