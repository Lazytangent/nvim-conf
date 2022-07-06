local utils = require('mappings.utils')

local f = {
  a = { utils.extensions_telescope 'search_all_files()', 'All files' },
  b = { utils.telescope_builtin 'buffers()', 'Buffers' },
  c = { utils.telescope_builtin 'commands()', 'Commands' },
  d = { utils.telescope_builtin 'diagnostics({ bufnr = 0 })', "Local diagnostics" },
  f = { utils.telescope_builtin 'find_files()', "Files" },
  g = { utils.telescope_extensions 'live_grep_args.live_grep_args()', "Live grep" },
  h = { utils.telescope_builtin 'help_tags()', 'Help tags' },
  i = { utils.telescope_builtin 'lsp_implementations()', 'LSP Implementations' },
  j = { utils.telescope_builtin 'jumplist()', "Jumplist" },
  l = { utils.telescope_builtin 'loclist()', "Loclist" },
  m = { utils.telescope_builtin 'marks()', "Marks" },
  n = { utils.telescope_builtin 'diagnostics()', "Global diagnostics" },
  o = { utils.telescope_builtin 'quickfixhistory()', "Quickfix History" },
  p = { utils.telescope_builtin 'pickers()', "Pickers" },
  q = { utils.telescope_builtin 'quickfix()', "Quickfix" },
  r = { utils.telescope_builtin 'lsp_references()', "LSP References" },
  s = { utils.telescope_builtin 'resume()', "Resume" },
  t = { utils.telescope_builtin 'grep_string()', "This word" },
  w = { utils.telescope_extensions 'workspaces.workspaces()', "Workspaces" },
  y = { utils.cmd 'Telescope yabs tasks', "Yabs" },

  A = { utils.telescope_extensions 'frecency.frecency()', "Frecency" },
  B = { utils.telescope_extensions 'file_browser.file_browser()', "File browser" },
  D = { utils.telescope_builtin 'lsp_definitions()', "LSP Definitions" },
  G = { utils.telescope_builtin 'git_status()', "Git" },
  L = { utils.telescope_extensions 'luasnip.luasnip()<cr>', "Luasnip" },
  O = { utils.telescope_builtin 'oldfiles()', "Old files (recent)" },
  P = { utils.cmd [[lua require('utils.core').search_nvim()]], "Private config" },
  R = { utils.telescope_builtin 'registers()', "Registers" },
  T = { utils.telescope_builtin 'treesitter()', "Treesitter" },

  ['/'] = { utils.telescope_builtin 'current_buffer_fuzzy_find()', "Search current buffer" },
  ['?'] = { utils.telescope_builtin 'search_history()', "Search history" },
  [';'] = { utils.telescope_builtin 'command_history()', "Command history" },

  s = { utils.cmd "w", "Save file" },
}

return f
