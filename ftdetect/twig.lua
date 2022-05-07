vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.twig",
  command = "setlocal syntax=html filetype=html",
})
