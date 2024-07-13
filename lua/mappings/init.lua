local normal = require('mappings.normal')
local visual = require('mappings.visual')
local insert = require('mappings.insert')

local visual_only = {
  { "ga", [[<Plug>(EasyAlign)]], desc = "Easy Align" },
}

local select = {
  { "<C-e>", group = "LuaSnip Jumps", },
  { "<C-e><C-n>", [[<Plug>luasnip-expand-or-jump]], desc = "Next choice" },
  { "<C-e><C-p>", [[<Plug>luasnip-jump-prev]],      desc = "Prev choice" },
  { "<C-u>", [[<cmd>lua require("luasnip.extras.select_choice")()<cr>]], desc = "Select Choice Node" },
}

local util = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local terminal = {
  { "<C-W>", util('<C-\\><C-N><C-W>'),    desc = "Window movement" },
  { "<C-#>", util('<C-\\><C-N>:bd!<cr>'), desc = "Close terminal" },
}

local wk = require "which-key"

wk.add({
  {
    mode = "s",
    select,
  },
  {
    mode = "t",
    terminal,
  },
  {
    mode = "x",
    visual_only,
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
})

require("mappings.custom")
