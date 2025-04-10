vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = ".nsprc",
  callback = function()
    vim.bo.filetype = "json"
  end,
})
