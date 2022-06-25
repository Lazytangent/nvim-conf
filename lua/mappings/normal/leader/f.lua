local cmd = function(command)
  return table.concat({ '<cmd>', command, '<cr>' })
end
local telescope_builtin = function(func)
  return cmd([[lua require('telescope.builtin').]] .. func)
end
local telescope_extensions = function(func)
  return cmd([[lua require('telescope').extensions.]] .. func)
end
local extensions_telescope = function(func)
  return cmd([[lua require('extensions.telescope').]] .. func)
end

local f = {
  a = { extensions_telescope 'search_all_files()', 'All files' },
  b = { telescope_builtin 'buffers()', 'Buffers' },
  c = { telescope_builtin 'commands()', 'Commands' },
  d = { telescope_builtin 'diagnostics({ bufnr = 0 })', "Local diagnostics" },
  f = { telescope_builtin 'find_files()', "Files" },
  g = { telescope_builtin 'live_grep_args.live_grep_args()', "Live grep" },
  h = { telescope_builtin 'help_tags()', 'Help tags' },
  i = { telescope_builtin 'lsp_implementations()', 'LSP Implementations' },
  j = { telescope_builtin 'jumplist()', "Jumplist" },
  l = { telescope_builtin 'loclist()', "Loclist" },
  m = { telescope_builtin 'marks()', "Marks" },
  n = { telescope_builtin 'diagnostics()', "Global diagnostics" },
  o = { telescope_builtin 'quickfixhistory()', "Quickfix History" },
  p = { telescope_builtin 'pickers()', "Pickers" },
  q = { telescope_builtin 'quickfix()', "Quickfix" },
  r = { telescope_builtin 'lsp_references()', "LSP References" },
  t = { telescope_builtin 'grep_string()', "This word" },
  y = { cmd 'Telescope yabs tasks', "Yabs" },

  A = { telescope_extensions 'frecency.frecency()', "Frecency" },
  B = { telescope_extensions 'file_browser.file_browser()', "File browser" },
  D = { telescope_builtin 'lsp_definitions()', "LSP Definitions" },
  G = { telescope_builtin 'git_status()', "Git" },
  L = { telescope_extensions 'luasnip.luasnip()<cr>', "Luasnip" },
  P = { cmd [[lua require('utils.core').search_nvim()]], "Private config" },
  R = { telescope_builtin 'registers()', "Registers" },
  T = { telescope_builtin 'treesitter()', "Treesitter" },

  ['/'] = { telescope_builtin 'current_buffer_fuzzy_find()', "Search current buffer" },
  ['?'] = { telescope_builtin 'search_history()', "Search history" },
  [';'] = { telescope_builtin 'command_history()', "Command history" },

  s = { cmd "w", "Save file" },
}

return f
