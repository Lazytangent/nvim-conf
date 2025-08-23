local Hydra = require('hydra')

local gitignore = Hydra({
  hint = [[
  _t_ shared at toplevel (.gitignore)
  ]],
  config = {
    invoke_on_body = true,
  },
  heads = {
    {
      't',
      function()
        vim.notify('toplevel')
        print('toplevel')
      end,
      {
        exit = true,
      },
    },
  },
})

Hydra({
  hint = [[
  _i_ Ignore
  ]],
  config = {
    invoke_on_body = true,
  },
  body = "<leader>gx",
  heads = {
    {
      'i',
      function()
        Hydra.activate(gitignore)
      end,
      {
        exit = true,
        nowait = true,
      },
    },
  },
})
