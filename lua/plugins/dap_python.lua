local dap_python = require('dap-python')
local dap = require('dap')

dap_python.setup('~/Documents/Debugger/debugpy/bin/python')
dap_python.test_runner = 'pytest'

table.insert(dap.configurations.python, {
  name = "Flask: Local",
  type = "python",
  request = "launch",
  module = "flask",
  args = {"run", "--no-debugger", "--no-reload"},
})

table.insert(dap.configurations.python, {
  name = 'Generic Remote',
  type = 'Docker',
  request = 'launch',

})

table.insert(dap.configurations.python, {
  name = 'FastAPI',
  type = 'python',
  request = 'launch',
  module = 'uvicorn',
  args = {'main:app'}
})
