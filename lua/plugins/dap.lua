local dap = require "dap"
local dap_install = require "dap-install"
dap.set_log_level "DEBUG"

local debug_host = "0.0.0.0"
local debug_port = 5678
local args = 'docker-compose -f "../docker-compose-dev.yml" exec -T -w /usr/src/app debug python -m debugpy --listen '
  .. debug_host
  .. ":"
  .. debug_port
  .. "application.py"

local M = {}

M.configure_python_debugger = function()
  dap.adapters.python = {
    type = "server",
    host = "0.0.0.0",
    port = 5678,
  }

  dap.configurations.python = {
    {
      name = "Flask",
      type = "python",
      request = "launch",
      args = {"run", "--no-debugger"},
      env = {
        FLASK_APP = "application.py",
        FLASK_ENV = "development",
        RX_CONFIG = "dev.TestingDevDockerConfig",
      },
      module = "flask",
      connect = {
        host = debug_host,
        port = debug_port,
      },
      mode = "remote",
      pathMappings = { {
        localRoot = vim.fn.getcwd(),
        remoteRoot = "/usr/src/app",
      } },
    },
    {
      name = "Flask (development mode)",
      type = "python",
      request = "launch",
      module = "flask",
      mode = "remote",
      env = {
        FLASK_APP = "application.py",
        FLASK_ENV = "development",
        RX_CONFIG = "dev.DevDockerConfig",
      },
      args = { "run" },
      pathMappings = { {
        localRoot = vim.fn.getcwd(),
        remoteRoot = "/usr/src/app",
      } },
    },
  }
end

return M
