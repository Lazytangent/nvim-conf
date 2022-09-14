if vim.g.vv == 1 then
  require("guis.vv")
end

if vim.g.goneovim == 1 then
  require("guis.goneovim")
end

require('guis.neovide')

if vim.fn.has("gui_vimr") == 1 then
  vim.cmd [[ echo "in vimr block" ]]

  vim.cmd [[
    colorscheme oxocarbon-lua
    colorscheme catppuccin
  ]]
end
