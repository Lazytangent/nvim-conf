local dap = require 'dap'

return {
  { "<leader>d",   group = "Debugger" },
  { "<leader>dc",  dap.continue,                              desc = "Start or Continue" },
  { "<leader>dg",  dap.run_to_cursor,                         desc = "Run to cursor" },
  { "<leader>di",  dap.step_into,                             desc = "Step Into" },
  { "<leader>dj",  dap.up,                                    desc = "Up stacktrace" },
  { "<leader>dk",  dap.down,                                  desc = "Down stacktrace" },
  { "<leader>dl",  require('dap.ext.vscode').load_launchjs,   desc = "Load .vscode/launch.json configs" },
  { "<leader>dn",  dap.step_over,                             desc = "Step Over" },
  { "<leader>do",  dap.step_out,                              desc = "Step Out" },
  { "<leader>dr",  require('dap.repl').open,                  desc = "Open REPL" },
  { "<leader>dt",  dap.toggle_breakpoint,                     desc = "Toggle breakpoint" },
  { "<leader>dd",  group = "Utils" },
  { "<leader>ddc", dap.clear_breakpoints,                     desc = "Clear all breakpoints" },
  { "<leader>ddl", dap.list_breakpoints,                      desc = "Lists all breakpoints in quickfix" },
}
