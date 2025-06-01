vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*mbsyncrc",
  command = "setlocal filetype=mbsync",
})
