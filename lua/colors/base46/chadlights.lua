-- returns a huge table of all highlight groups & their colors

local merge_tb = require("colors.base46.base46").merge_tb

local highlights = {}
local hl_dir = "/Users/pmai/.config/nvim/lua/colors/base46/integrations"

-- push all file names in hl_dir to a table
local hl_files = require("plenary.scandir").scan_dir(hl_dir, {})

for _, file in ipairs(hl_files) do
   local a = vim.fn.fnamemodify(file, ":t")
   a = vim.fn.fnamemodify(a, ":r")

   local integration = require("colors.base46.integrations." .. a)
   highlights = merge_tb(highlights, integration)
end

-- term colors
require "colors.base46.term_hl"

-- finally set all highlights :D
for hl, col in pairs(highlights) do
   vim.api.nvim_set_hl(0, hl, col)
end
