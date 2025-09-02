local Hydra = require('hydra')

Hydra({
  hint = [[
  _b_ Bookmarks
  _d_ Describe
  _l_ Log
  _s_ Status
  ]],
  config = {
    invoke_on_body = true,
  },
  body = "<leader>jk",
  heads = {
    {
      'l',
      function() vim.notify('Log') end,
      { exit = true },
    },
    {
      'b',
      function() vim.notify('Bookmarks') end,
      { exit = true },
    },
    {
      'd',
      function() vim.notify('Describe') end,
      { exit = true },
    },
    {
      's',
      function() vim.notify('Status') end,
      { exit = true },
    },
  },
})
