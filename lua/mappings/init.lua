local ls = require 'luasnip'

local normal = require 'mappings.normal'
local visual = require 'mappings.visual'
local insert = require 'mappings.insert'

local select = {
  { "<C-e>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, desc = "Select Choice Node" },
}

local util = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local terminal = {
  { "<C-W>", util('<C-\\><C-N><C-W>'),    desc = "Window movement" },
  { "<C-#>", util('<C-\\><C-N>:bd!<cr>'), desc = "Close terminal" },
}

local wk = require "which-key"

wk.add {
  {
    mode = "s",
    select,
  },
  {
    mode = "t",
    terminal,
  },
  {
    mode = "i",
    insert,
  },
  {
    mode = "v",
    visual,
  },
  {
    normal,
  },
}

-- Trying out mini.ai for textobjects
-- require "mappings.treesitter-textobjects"
