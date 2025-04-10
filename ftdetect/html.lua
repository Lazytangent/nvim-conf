vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.html",
  callback = function()
    vim.bo.filetype = "htmldjango"
  end,
})
