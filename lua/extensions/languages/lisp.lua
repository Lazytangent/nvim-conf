return {
  {
    "kovisoft/slimv",
    init = function()
      vim.g.slimv_indent_disable = true
      vim.g.slimv_unmap_cr = true
    end,
  },
  {
    "julienvincent/nvim-paredit",
    opts = {
      filetypes = {
        "clojure",
        "commonlisp",
        "fennel",
        "scheme",
        "lisp",
      },
    },
  },
}
