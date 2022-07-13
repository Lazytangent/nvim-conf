local dap = require "dap"
local utils = require("utils.core")
dap.set_log_level "DEBUG"

local modules = {
  'dap_python',
  'dap_ui',
  'dap_virtual_text',
}

utils.load_modules("extensions", modules)

local custom_python_configs = {
  {
    name = "Flask: Local",
    type = "python",
    request = "launch",
    module = "flask",
    args = {"run", "--no-debugger", "--no-reload"},
  },
  {
    name = 'Generic Remote',
    type = 'python',
    request = 'attach',
    port = 5678,
    host = 'localhost',
    pathMappings = {
      {
        localRoot = vim.fn.getcwd(),
        remoteRoot = "/usr/src/app",
      },
    },
  },
  {
    name = 'FastAPI',
    type = 'python',
    request = 'launch',
    module = 'uvicorn',
    args = {'main:app'},
  },
}

for _, v in ipairs(custom_python_configs) do
  table.insert(dap.configurations.python, v)
end
