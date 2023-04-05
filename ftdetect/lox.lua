local group = vim.api.nvim_create_augroup("Lox", {})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = { "*.lox" },
  command = "setfiletype lox",
})
