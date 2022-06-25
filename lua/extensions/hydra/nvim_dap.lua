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

local hint = [[]]

Hydra({
  name = "Nvim DAP",
  mode = "n",
  body = "<leader>d",
  config = {
    color = "pink",
    invoke_on_body = true,
    on_enter = function()
      dapui.open()
    end,
    on_close = function()
      dapui.close()
    end,
    hint = {
      position = "bottom",
    },
  },
  heads = {
    { 'c', require_dap "continue()", { desc = "Start or Continue" } },
    { 'dc', require_dap "clear_breakpoints()", { desc = "Clear breakpoints" } },
    { 'dl', require_dap "list_breakpoints()", { desc = "List breakpoints" } },
    { 'g', require_dap "run_to_cursor()", { desc = "Run to cursor" } },
    { 'i', require_dap "step_into()", { desc = "Step into" } },
    { 'j', require_dap "up()", { desc = "Load .vscode/launch.json configs" } },
    { 'k', require_dap { desc = "Load .vscode/launch.json configs" } },
    { 'l', require_dap_vscode "load_launchjs()", { desc = "Load .vscode/launch.json configs" } },
    { 'n', require_dap "step_over()", { desc = "Load .vscode/launch.json configs" } },
    { 'o', require_dap "step_out()", { desc = "Load .vscode/launch.json configs" } },
    { 'p', extensions_dap "configure_python_debugger()", { desc = "Load .vscode/launch.json configs" } },
    { 'r', dap_repl "open()", { desc = "Load .vscode/launch.json configs" } },
    { 't', require_dap "toggle_breadpoint()", { desc = "Load .vscode/launch.json configs" } },
    { 'fc', require_telescope "load_launchjs()", { desc = "Load .vscode/launch.json configs" } },
    { 'ff', require_telescope "load_launchjs()", { desc = "Load .vscode/launch.json configs" } },
    { 'fl', require_telescope "load_launchjs()", { desc = "Load .vscode/launch.json configs" } },
    { 'fo', require_telescope "load_launchjs()", { desc = "Load .vscode/launch.json configs" } },
    { 'fv', require_telescope "load_launchjs()", { desc = "Load .vscode/launch.json configs" } },
    { 'uc', require_dapui "load_launchjs()", { desc = "Load .vscode/launch.json configs" } },
    { 'uo', require_dapui "load_launchjs()", { desc = "Load .vscode/launch.json configs" } },
    { 'ut', require_dapui "load_launchjs()", { desc = "Load .vscode/launch.json configs" } },
    { 'uu', require_dapui "load_launchjs()", { desc = "Load .vscode/launch.json configs" } },
  },
})
