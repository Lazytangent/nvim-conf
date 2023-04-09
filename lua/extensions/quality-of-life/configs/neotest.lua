local neotest = require('neotest')

neotest.setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
    require("neotest-jest")({
      jestCommand = "npm test --",
    }),
    require("neotest-rust"),
  },
  icons = {
    running = "R",
  },
  output = {
    open_on_run = true,
  },
})

vim.api.nvim_create_user_command('NextTest', function()
  neotest.jump.next()
end, {})

vim.api.nvim_create_user_command('PrevTest', function()
  neotest.jump.prev()
end, {})

vim.api.nvim_create_user_command('NextFail', function()
  neotest.jump.next({ status = "failed" })
end, {})

vim.api.nvim_create_user_command('PrevFail', function()
  neotest.jump.prev({ status = "failed" })
end, {})

vim.api.nvim_create_user_command('TestNearest', function()
  neotest.run.run()
end, {})

vim.api.nvim_create_user_command('TestRecent', function()
  neotest.run.run_last()
end, {})

vim.api.nvim_create_user_command('TestFile', function()
  neotest.run.run(vim.fn.expand('%'))
end, {})

vim.api.nvim_create_user_command('DebugNearestTest', function()
  neotest.run.run({ strategy = "dap" })
end, {})

vim.api.nvim_create_user_command('StopTest', function()
  neotest.run.stop()
end, {})

vim.api.nvim_create_user_command('AttachTest', function()
  neotest.run.attach()
end, {})

vim.api.nvim_create_user_command('OpenTestOutput', function()
  neotest.output.open()
end, {})
