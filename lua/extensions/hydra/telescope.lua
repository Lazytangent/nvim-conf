local Hydra = require("hydra")

local hint = [[
 _a_: All files    _b_: Buffers          _c_: Commands        _d_: Diagnostics (local)
 _f_: Files        _g_: Grep             _h_: Vim Help        _i_: LSP Implementations
 _j_: Jumplist     _l_: Loclist          _m_: Marks           _n_: Diagnostics
 _p_: Pickers      _q_: Quickfix         _r_: Registers       _t_: Grep This
 _y_: Yabs         _/_: Search buffer    _?_: Search History  _;_: Command history
 _A_: Frecency     _B_: File Browser     _D_: LSP Definitions _G_: Git status
 _L_: Luasnip      _P_: Personal config  _R_: Registers       _T_: Treesitter
 ^
 _o_: Quickfix History           _<Enter>_: Telescope       ^ ^            _<Esc>_
]]

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

Hydra({
  hint = hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
        position = 'middle',
        border = 'rounded',
    },
  },
  mode = 'n',
  body = '<Leader>f',
  heads = {
    { 'a', extensions_telescope 'search_all_files()' },
    { 'b', telescope_builtin 'buffers()' },
    { 'c', telescope_builtin 'commands()', { desc = 'Execute command' } },
    { 'd', telescope_builtin 'diagnostics({ bufnr = 0 })' },
    { 'f', telescope_builtin 'find_files()' },
    { 'g', telescope_builtin 'live_grep_args.live_grep_args()' },
    { 'h', telescope_builtin 'help_tags()', { desc = 'Vim help' } },
    { 'i', telescope_builtin 'lsp_implementations()' },
    { 'j', telescope_builtin 'jumplist()' },
    { 'l', telescope_builtin 'loclist()' },
    { 'm', telescope_builtin 'marks()' },
    { 'n', telescope_builtin 'diagnostics()' },
    { 'o', telescope_builtin 'quickfixhistory()' },
    { 'p', telescope_builtin 'pickers()', { desc = 'Pickers' } },
    { 'q', telescope_builtin 'quickfix()' },
    { 'r', telescope_builtin 'lsp_references()' },
    { 't', telescope_builtin 'grep_string()' },
    { 'y', cmd 'Telescope yabs tasks' },

    { 'A', telescope_extensions 'frecency.frecency()' },
    { 'B', telescope_extensions 'file_browser.file_browser()' },
    { 'D', telescope_builtin 'lsp_definitions()' },
    { 'G', telescope_builtin 'git_status()' },
    { 'L', telescope_extensions 'luasnip.luasnip()<cr>' },
    { 'P', cmd [[lua require('utils.core').search_nvim()]] },
    { 'R', telescope_builtin 'registers()' },
    { 'T', telescope_builtin 'treesitter()' },

    { '/', telescope_builtin 'current_buffer_fuzzy_find()' },
    { '?', telescope_builtin 'search_history()',  { desc = 'Search history' } },
    { ';', telescope_builtin 'command_history()', { desc = 'Command-line history' } },
    { '<Enter>', cmd 'Telescope', { exit = true, desc = 'List all pickers' } },
    { '<Esc>', nil, { exit = true, nowait = true } },
  }
})
