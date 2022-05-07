vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.jinja",
  command = "setlocal syntax=htmljinja",
})
