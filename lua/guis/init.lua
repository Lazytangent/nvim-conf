if vim.g.vv == 1 then
  require("guis.vv")
end

if vim.g.goneovim == 1 then
  require("guis.goneovim")
end

if vim.fn.has("gui_vimr") == 1 then
  vim.cmd [[ echo "in vimr block" ]]

  vim.cmd [[
    colorscheme oxocarbon-lua
    colorscheme catppuccin
  ]]
end

if vim.g.neovide then
  vim.schedule(function()
    vim.cmd [[set guifont=FiraCode\ Nerd\ Font:h12]]
    require('guis.neovide')
  end)
end
