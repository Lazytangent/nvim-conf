local Hydra = require('hydra')
local dap = require('dap')
local dapui = require('dapui')

local cmd = function(func)
  return table.concat({ '<cmd>', func, '<cr>' })
end
local require_dap = function(func)
  return cmd("lua require('dap')." .. func)
end
local require_dap_vscode = function(func)
  return cmd("lua require('dap.ext.vscode)." .. func)
end
local extensions_dap = function(func)
  return cmd("lua require('extensions.dap')." .. func)
end
local require_telescope = function(func)
  return cmd("lua require('telescope')." .. func)
end
local require_dapui = function(func)
  return cmd("lua require('dapui')." .. func)
end
local dap_repl = function(func)
  return cmd("lua require('dap.repl')." .. func)
end

local hint = [[
_c_: Continue      _g_: Run to Cursor            _i_: Step Into _j_: Down stacktrace
_k_: Up stacktrace _l_: Load .vscode/launch.json _n_: Step Over _o_: Step Out
_p_: Attach Python Debugger          _r_: Open REPL           _t_: Toggle Breakpoint

        _dc_: Clear breakpoints               _dl_: List breakpoints

_fc_: Commands    _ff_: Frames      _fl_: List breakpoints      _fo_: Configurations
                          _fv_: Variables

_uc_: Close UI    _uo_: Open UI     _ut_: Toggle UI             _uu_: Toggle UI

                               _<Esc>_
]]

Hydra({
  hint = hint,
  name = "Nvim DAP",
  mode = "n",
  body = "<leader>d",
  config = {
    color = "pink",
    invoke_on_body = true,
    on_enter = function()
      dapui.open()
    end,
  },
  heads = {
    { 'c', require_dap "continue()", { desc = "Start or Continue" } },
    { 'dc', require_dap "clear_breakpoints()", { desc = "Clear breakpoints" } },
    { 'dl', require_dap "list_breakpoints()", { desc = "List breakpoints" } },
    { 'g', require_dap "run_to_cursor()", { desc = "Run to cursor" } },
    { 'i', require_dap "step_into()", { desc = "Step into" } },
    { 'j', require_dap "up()", { desc = "Up stacktrace" } },
    { 'k', require_dap "down()", { desc = "Down stacktrace" } },
    { 'l', require_dap_vscode "load_launchjs()", { desc = "Load .vscode/launch.json configs" } },
    { 'n', require_dap "step_over()", { desc = "Step over" } },
    { 'o', require_dap "step_out()", { desc = "Step out" } },
    { 'p', extensions_dap "configure_python_debugger()", { desc = "Attach Python debugger" } },
    { 'r', dap_repl "open()", { desc = "Open REPL" } },
    { 't', require_dap "toggle_breadpoint()", { desc = "Toggle breakpoint" } },
    { 'fc', require_telescope "extensions.dap.commands()", { desc = "Telescope: DAP Commands" } },
    { 'ff', require_telescope "extensions.dap.frames()", { desc = "Telescope: DAP Frames" } },
    { 'fl', require_telescope "extensions.dap.list_breakpoints()", { desc = "Telescope: DAP List Breakpoints" } },
    { 'fo', require_telescope "extensions.dap.configurations()", { desc = "Telescope: DAP Configurations" } },
    { 'fv', require_telescope "extensions.dap.variables()", { desc = "Telescope: DAP Variables" } },
    { 'uc', require_dapui "close()", { desc = "Close DAP UI" } },
    { 'uo', require_dapui "open()", { desc = "Open DAP UI" } },
    { 'ut', require_dapui "toggle()", { desc = "Toggle DAP UI" } },
    { 'uu', require_dapui "toggle()", { desc = "Toggle DAP UI" } },
    { "<Esc>", nil, { exit = true } },
  },
})
