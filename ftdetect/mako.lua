vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.mako",
  command = "setlocal filetype=mako",
})
