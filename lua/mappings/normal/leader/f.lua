local f = {
  name = "+Telescope",
  a = { [[<cmd>lua require('telescope').extensions.frecency.frecency()<cr>]], "Frecency" },
  b = { [[<cmd>lua require('telescope.builtin').buffers()<cr>]], "Find Buffers" },
  c = { [[<cmd>lua require('telescope.builtin').commands()<cr>]], "Commands" },
  d = { [[<cmd>lua require('telescope.builtin').diagnostics()<cr>]], "LSP Diagnostics" },
  e = { [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], "Search for string under cursor" },
  f = { [[<cmd>lua require('telescope.builtin').find_files()<cr>]], "Find files" },
  g = { [[<cmd>lua require('telescope').extensions.live_grep_raw.live_grep_raw()<cr>]], "Live grep" },
  h = { [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], "Help tags" },
  i = { [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], "In buffer" },
  j = { [[<cmd>lua require('telescope.builtin').jumplist()<cr>]], "Jumplist" },
  k = { [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]], "LSP References" },
  l = { [[<cmd>lua require('telescope.builtin').loclist()<cr>]], "Location list" },
  m = { [[<cmd>lua require('telescope.builtin').marks()<cr>]], "Marks" },
  n = { [[<cmd>lua require('telescope.builtin').diagnostics({ bufnr = 0 })<cr>]], "LSP Diagnostics in buffer" },
  o = { [[<cmd>lua require('telescope.builtin').quickfixhistory()<cr>]], "Old Quickfix Lists" },
  p = { [[<cmd>lua require('telescope.builtin').pickers()<cr>]], "Prev Pickers" },
  q = { [[<cmd>lua require('telescope.builtin').quickfix()<cr>]], "Quickfix list" },
  r = { [[<cmd>lua require('telescope.builtin').registers()<cr>]], "Registers" },
  t = { [[<cmd>lua require('telescope.builtin').treesitter()<cr>]], "Treesitter" },
  y = { [[<cmd>Telescope yabs tasks<cr>]], "Telescope: Yabs" },

  z = {
    name = "+LSP Specific",
    d = { [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]], "LSP Definitions" },
    i = { [[<cmd>lua require('telescope.builtin').lsp_implementations()<cr>]], "LSP Implementations" },
    r = { [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]], "LSP References" },
  },

  A = { [[<cmd>lua require('plugins.telescope').search_all_files()<cr>]], "All files" },
  B = { [[<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>]], "File browser" },
  D = { [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]], "LSP Definitions" },
  I = { [[<cmd>lua require('telescope.builtin').lsp_implementations()<cr>]], "LSP Implementations" },
  P = { [[<cmd>lua require('utils.core').search_nvim()<cr>]], "Search Nvim config" },
  R = { [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]], "LSP References" },

  s = { [[<cmd>w<cr>]], "Save file" },
}

return f
