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
  },
  icons = {
    running = "R",
  },
  output = {
    open_on_run = true,
  },
})

vim.api.nvim_create_user_command('NextTest', function(args)
  neotest.jump.next()
end, {})

vim.api.nvim_create_user_command('PrevTest', function(args)
  neotest.jump.prev()
end, {})

vim.api.nvim_create_user_command('NextFail', function(args)
  neotest.jump.next({ status = "failed" })
end, {})

vim.api.nvim_create_user_command('PrevFail', function(args)
  neotest.jump.prev({ status = "failed" })
end, {})

vim.api.nvim_create_user_command('TestNearest', function(args)
  neotest.run.run()
end, {})

vim.api.nvim_create_user_command('TestRecent', function(args)
  neotest.run.run_last()
end, {})

vim.api.nvim_create_user_command('TestFile', function(args)
  neotest.run.run(vim.fn.expand('%'))
end, {})

vim.api.nvim_create_user_command('DebugNearestTest', function(args)
  neotest.run.run({ strategy = "dap" })
end, {})

vim.api.nvim_create_user_command('StopTest', function(args)
  neotest.run.stop()
end, {})

vim.api.nvim_create_user_command('AttachTest', function(args)
  neotest.run.attach()
end, {})

vim.api.nvim_create_user_command('OpenTestOutput', function(args)
  neotest.output.open()
end, {})
