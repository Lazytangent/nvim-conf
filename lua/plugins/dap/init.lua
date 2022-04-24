local dap = require "dap"
dap.set_log_level "DEBUG"

require 'plugins.dap_python'
require 'plugins.dap_ui'
require 'plugins.dap_virtual_text'

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
  },
  {
    name = 'FastAPI',
    type = 'python',
    request = 'launch',
    module = 'uvicorn',
    args = {'main:app'}
  }
}

for _, v in ipairs(custom_python_configs) do
  table.insert(dap.configurations.python, v)
end
