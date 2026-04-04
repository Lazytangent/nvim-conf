local theming = require("config").theming

local C = theming.colorscheme
vim.g.catppuccin_flavour = "mocha"

if C ~= nil then
  vim.cmd.colorscheme(C)
end
