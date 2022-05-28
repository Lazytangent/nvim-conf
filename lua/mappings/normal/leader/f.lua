local telescope_builtin = [[<cmd>lua require('telescope.builtin').]]
local telescope_extensions = [[<cmd>lua require('telescope').extensions.]]
local plugins_telescope = [[<cmd>lua require('plugins.telescope').]]

local f = {
  name = "+Telescope",
  a = { plugins_telescope .. [[search_all_files()<cr>]],                "All files" },
  b = { telescope_builtin .. [[buffers()<cr>]],                         "Buffers" },
  c = { telescope_builtin .. [[current_buffer_fuzzy_find()<cr>]],       "Current buffer" },
  d = { telescope_builtin .. [[diagnostics({ bufnr = 0 })<cr>]],        "LSP Diagnostics in buffer" },
  f = { telescope_builtin .. [[find_files()<cr>]],                      "Find files" },
  g = { telescope_extensions .. [[live_grep_raw.live_grep_raw()<cr>]],  "Live grep" },
  h = { telescope_builtin .. [[help_tags()<cr>]],                       "Help tags" },
  i = { telescope_builtin .. [[lsp_implementations()<cr>]],             "Implementations" },
  j = { telescope_builtin .. [[jumplist()<cr>]],                        "Jumplist" },
  l = { telescope_builtin .. [[loclist()<cr>]],                         "Location list" },
  m = { telescope_builtin .. [[marks()<cr>]],                           "Marks" },
  n = { telescope_builtin .. [[diagnostics()<cr>]],                     "LSP Diagnostics" },
  o = { telescope_builtin .. [[quickfixhistory()<cr>]],                 "Old Quickfix Lists" },
  p = { telescope_builtin .. [[pickers()<cr>]],                         "Prev Pickers" },
  q = { telescope_builtin .. [[quickfix()<cr>]],                        "Quickfix list" },
  r = { telescope_builtin .. [[lsp_references()<cr>]],                  "LSP References" },
  t = { telescope_builtin .. [[grep_string()<cr>]],                     "Find this" },
  y = { [[<cmd>Telescope yabs tasks<cr>]],                              "Telescope: Yabs" },

  A = { telescope_extensions .. [[frecency.frecency()<cr>]],          "Frecency" },
  B = { telescope_extensions .. [[file_browser.file_browser()<cr>]],  "File browser" },
  D = { telescope_builtin .. [[lsp_definitions()<cr>]],               "LSP Definitions" },
  G = { telescope_builtin .. [[git_status()<cr>]],                    "Git" },
  P = { [[<cmd>lua require('utils.core').search_nvim()<cr>]],         "Search Nvim config" },
  R = { telescope_builtin .. [[registers()<cr>]],                     "Registers" },
  T = { telescope_builtin .. [[treesitter()<cr>]],                    "Treesitter" },

  s = { [[<cmd>w<cr>]], "Save file" },
}

return f
