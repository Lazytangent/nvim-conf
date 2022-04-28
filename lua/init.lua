-- Basic settings
require "utils.handlers"
require "config"
require "plugins"

vim.g.mapleader = " "
vim.g.maplocalleader = " m"

-- LSP
require "lsp"

-- Personal config
require "basic"

-- GUI Config
require "guis"
require "commands"

vim.api.nvim_command "packadd! cfilter"
