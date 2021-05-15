-- Auto install packer.nvim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone git@github.com:wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end
