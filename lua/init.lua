-- Basic settings
require "utils.handlers"
require "config"
require "plugins"

-- LSP
require "lsp"

vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Plugins
require "plugins.general"

-- Personal config
require "basic"
