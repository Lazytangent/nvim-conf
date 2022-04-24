local dap_python = require('dap-python')
local dap = require('dap')

dap_python.setup('~/Documents/Debugger/debugpy/bin/python')
dap_python.test_runner = 'pytest'
