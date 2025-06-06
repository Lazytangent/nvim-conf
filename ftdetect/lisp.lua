vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = { "*.lisp", "*.clisp", "*.cl" },
  command = "setlocal filetype=commonlisp",
})
