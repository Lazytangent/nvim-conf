local Hydra = require('hydra')

Hydra({
  hint = [[
  _l_ Log
  ]],
  config = {
    invoke_on_body= true,
  },
  body = "<leader>jk",
  heads = {
    {
      'l',
      function () vim.notify('Log') end,
      { exit = true },
    },
  },
})
