vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.sequelizerc",
  command = "setlocal filetype=javascript",
})
