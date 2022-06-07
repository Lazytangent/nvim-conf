local f = {
  name = "+Telescope",
  a = { [[<cmd>lua require('extensions.telescope').search_all_files()<cr>]],          "All files" },
  b = { [[<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>]], "File browser" },
  f = { [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]],    "Fuzzy find" },
  g = { [[<cmd>lua require('telescope.builtin').git_status()<cr>]],                   "Git" },
  l = { [[<cmd>lua require('telescope').extensions.lazygit.lazygit()<cr>]],           "Lazygit" },
  p = { [[<cmd>lua require('telescope.builtin').resume()<cr>]],                       "Resume" },
  P = { [[<cmd>lua require('telescope.builtin').pickers()<cr>]],                      "Previous pickers" },
  t = { [[<cmd>lua require('telescope.builtin').tags()<cr>]],                         "Tags" },

  d = { [[<cmd>lua require('telescope.builtin').lsp_definitions()<cr>]],     "Definitions" },
  i = { [[<cmd>lua require('telescope.builtin').lsp_implementations()<cr>]], "Implementations" },
  r = { [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]],      "References" },
}

return f
