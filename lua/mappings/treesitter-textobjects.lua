local wk = require 'which-key'

local select = require 'nvim-treesitter-textobjects.select'
local move = require 'nvim-treesitter-textobjects.move'

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
      -- {
      --   'ac',
      --   function()
      --     select.select_textobject("@class.outer", "textobjects")
      --   end,
      -- },
      -- {
      --   'ic',
      --   function()
      --     select.select_textobject("@class.inner", "textobjects")
      --   end,
      -- },
      {
        'as',
        function()
          select.select_textobject("@local.scope", "textobjects")
        end,
      },
    },
  },
  {
    -- move
    mode = { 'n', 'x', 'o' },
    {
      {
        ']m',
        function()
          move.goto_next_start("@function.outer", "textobjects")
        end,
      },
      {
        ']]',
        function()
          move.goto_next_start("@class.outer", "textobjects")
        end,
      },
      {
        ']o',
        function()
          move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
        end,
      },
      {
        ']z',
        function()
          move.goto_next_start("@fold", "folds")
        end,
      },
      {
        ']M',
        function()
          move.goto_next_end("@function.outer", "textobjects")
        end,
      },
      {
        '][',
        function()
          move.goto_next_end("@class.outer", "textobjects")
        end,
      },
      {
        '[m',
        function()
          move.goto_previous_start("@function.outer", "textobjects")
        end,
      },
      {
        '[[',
        function()
          move.goto_previous_start("@class.outer", "textobjects")
        end,
      },
      {
        '[o',
        function()
          move.goto_previous_start({ "@loop.inner", "@loop.outer" }, "textobjects")
        end,
      },
      {
        '[z',
        function()
          move.goto_previous_start("@fold", "folds")
        end,
      },
      {
        '[M',
        function()
          move.goto_previous_end("@function.outer", "textobjects")
        end,
      },
      {
        '[]',
        function()
          move.goto_previous_end("@class.outer", "textobjects")
        end,
      },
    },
  },
}
