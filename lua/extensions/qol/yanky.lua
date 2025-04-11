return {
  'gbprod/yanky.nvim',
  keys = {
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" } },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" } },

    { "<C-p>", "<Plug>(YankyPreviousEntry)" },
    { "<C-n>", "<Plug>(YankyNextEntry)" },
  },
  config = true,
}
