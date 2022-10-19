local d = {
  name = "+Debugger",
  c = { [[<cmd>lua require('dap').continue()<cr>]], "Start or Continue" },
  d = {
    name = "+Utils",
    c = { [[<cmd>lua require('dap').clear_breakpoints()<cr>]], "Clear all breakpoints" },
    l = { [[<cmd>lua require('dap').list_breakpoints()<cr>]],  "Lists all breakpoints in quickfix" },
  },
  i = { [[<cmd>lua require('dap').step_into()<cr>]],                            "Step Into" },
  l = { [[<cmd>lua require('dap.ext.vscode').load_launchjs()<cr>]],             "Load .vscode/launch.json configs" },
  g = { [[<cmd>lua require('dap').run_to_cursor()<cr>]],                        "Run to cursor" },
  j = { [[<cmd>lua require('dap').up()<cr>]],                                   "Up stacktrace" },
  k = { [[<cmd>lua require('dap').down()<cr>]],                                 "Down stacktrace" },
  n = { [[<cmd>lua require('dap').step_over()<cr>]],                            "Step Over" },
  o = { [[<cmd>lua require('dap').step_out()<cr>]],                             "Step Out" },
  r = { [[<cmd>lua require('dap.repl').open()<cr>]],                            "Open REPL" },
  t = { [[<cmd>lua require('dap').toggle_breakpoint()<cr>]],                    "Toggle breakpoint" },
  p = { [[<cmd>lua require('extensions.dap').configure_python_debugger()<cr>]], "Attach Python Debugger" },

  f = {
    name = "+Telescope",
    c = { [[<cmd>lua require('telescope').extensions.dap.commands()<cr>]],         "Commands" },
    f = { [[<cmd>lua require('telescope').extensions.dap.frames()<cr>]],           "Frames" },
    l = { [[<cmd>lua require('telescope').extensions.dap.list_breakpoints()<cr>]], "List Breakpoints" },
    o = { [[<cmd>lua require('telescope').extensions.dap.configurations()<cr>]],   "Configurations" },
    v = { [[<cmd>lua require('telescope').extensions.dap.variables()<cr>]],        "Variables" },
  },
  u = {
    name = "UI",
    c = { [[<cmd>lua require('dapui').close()<cr>]],  "Close" },
    o = { [[<cmd>lua require('dapui').open()<cr>]],   "Open" },
    t = { [[<cmd>lua require('dapui').toggle()<cr>]], "Toggle" },
    u = { [[<cmd>lua require('dapui').toggle()<cr>]], "Toggle" },
  },
}

return d
