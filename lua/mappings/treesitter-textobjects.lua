local wk = require 'which-key'
local select = require 'nvim-treesitter-textobjects.select'

wk.add {
  {
    -- select
    mode = { 'x', 'o' },
    {
      {
        'af',
        function()
          select.select_textobject("@function.outer", "textobjects")
        end,
      },
      {
        'if',
        function()
          select.select_textobject("@function.inner", "textobjects")
        end,
      },
      {
        'ac',
        function()
          select.select_textobject("@class.outer", "textobjects")
        end,
      },
      {
        'ic',
        function()
          select.select_textobject("@class.inner", "textobjects")
        end,
      },
      {
        'as',
        function()
          select.select_textobject("@local.scope", "textobjects")
        end,
      },
    },
  },
}
