local Hydra = require('hydra')

local gitignore = Hydra({
  hint = [[
  _t_ shared at toplevel (.gitignore)
  _s_ shared in subdirectory (path/to/.gitignore)
  _p_ privately (.git/info/exclude)
  _g_ privately for all repositories
  ]],
  config = {
    invoke_on_body = true,
  },
  heads = {
    {
      't',
      function()
        -- TODO: Open .gitignore file at the root of the current repository
        vim.notify('toplevel')
      end,
      {
        exit = true,
      },
    },
    {
      's',
      function()
        -- TODO: Open .gitignore file in subdirectory of open file
        vim.notify('subdirectory')
      end,
      {
        exit = true,
      },
    },
    {
      'p',
      function()
        -- TODO: Open .git/info/exclude file
        vim.notify('private')
      end,
      {
        exit = true,
      },
    },
    {
      'g',
      function()
        -- TODO: Get file for git setting 'core.excludesfile' and open that
        vim.notify('global')
      end,
      {
        exit = true,
      },
    },
  },
})

return gitignore
