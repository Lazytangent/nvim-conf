local normal = require('mappings.normal')
local visual = require('mappings.visual')
local insert = require('mappings.insert')

local visual_opts = { mode = "v", }

local insert_opts = { mode = "i", }

local visual_only = {
  { "ga", [[<Plug>(EasyAlign)]], desc = "Easy Align" },
}

local visual_only_opts = {
  mode = "x",
}

local select = {
  { "<C-e>", group = "LuaSnip Jumps", },
  { "<C-e><C-n>", [[<Plug>luasnip-expand-or-jump]], desc = "Next choice" },
  { "<C-e><C-p>", [[<Plug>luasnip-jump-prev]],      desc = "Prev choice" },
  { "<C-u>", [[<cmd>lua require("luasnip.extras.select_choice")()<cr>]], desc = "Select Choice Node" },
}

local select_opts = {
  mode = "s",
}

local util = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local terminal = {
  { "<C-W>", util('<C-\\><C-N><C-W>'),    desc = "Window movement" },
  { "<C-#>", util('<C-\\><C-N>:bd!<cr>'), desc = "Close terminal" },
}

local terminal_opts = {
  mode = "t",
}

local wk = require "which-key"

wk.add({
  {
    select_opts,
    select,
  },
  {
    terminal_opts,
    terminal,
  },
  {
    visual_only_opts,
    visual_only,
  },
  {
    insert_opts,
    insert,
  },
  {
    visual_opts,
    visual,
  },
  {
    normal,
  },
})

require("mappings.custom")
