local Theming = require("config").Theming

local C = Theming.colorscheme
vim.g.catppuccin_flavour = "mocha"

if C ~= nil then
  vim.cmd("colorscheme " .. C)
end
