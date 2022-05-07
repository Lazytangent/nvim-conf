vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.scm",
  command = "setlocal filetype=query",
})
