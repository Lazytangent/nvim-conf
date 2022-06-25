local Hydra = require("hydra")

local hint = [[
    Move             Split         ^^^^    Size
 -----------    ---------------    ^^^^-------------
    ^ _k_          ^_s_: horizontally    _+_ _-_: height
  _h_     _l_       _v_: vertically      _>_ _<_: width
    ^ _j_          ^_q_: close           ^ _=_ ^: equalize

                    _<Esc>_
]]

Hydra({
   hint = hint,
   config = {
      timeout = 1000,
      hint = {
         border = 'rounded',
      },
   },
   mode = 'n',
   body = '<C-w>',
   heads = {
      -- Move focus
      { 'h', '<C-w>h' },
      { 'j', '<C-w>j' },
      { 'k', '<C-w>k' },
      { 'l', '<C-w>l' },
      -- Split
      { 's', '<C-w>s' },
      { 'v', '<C-w>v' },
      { 'q', '<C-w>q', { desc = 'close window' } },
      -- Size
      { '+', '<C-w>+' },
      { '-', '<C-w>-' },
      { '>', '2<C-w>>', { desc = 'increase width' } },
      { '<', '2<C-w><', { desc = 'decrease width' } },
      { '=', '<C-w>=', { desc = 'equalize'} },
      --
      { '<Esc>', nil,  { exit = true }}
   }
})
