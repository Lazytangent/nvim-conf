local Hydra = require('hydra')

local hint = [[
 _-_: Decrease height   _+_: Increase height
 _<_: Decrease width    _>_: Increase width
]]

Hydra({
  hint = hint,
  config = {
    color = 'pink',
    invoke_on_body = true,
    hint = {
      position = 'bottom',
      border = 'rounded',
    },
  },
  name = "Window Resize",
  mode = "n",
  body = "<C-w>",
  heads = {
    { '-', '<C-w>-' },
    { '+', '<C-w>+' },
    { '<', '<C-w><' },
    { '>', '<C-w>>' },
  },
})
