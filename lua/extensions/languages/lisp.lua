return {
  {
    "kovisoft/slimv",
    init = function()
      vim.g.slimv_indent_disable = true
      vim.g.slimv_unmap_cr = true
    end,
  },
  {
    "tpope/vim-sexp-mappings-for-regular-people",
    dependencies = {
      "guns/vim-sexp",
      "tpope/vim-repeat",
    },
  },
  {
    "guns/vim-sexp",
    init = function()
      vim.g.sexp_filetypes = 'clojure,scheme,lisp,timl,fennel,commonlisp'
    end,
  },
}
