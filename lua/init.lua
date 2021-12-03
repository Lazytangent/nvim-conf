-- Basic settings
require "utils.handlers"
require "config"
require "plugins"

vim.g.mapleader = " m"
vim.g.maplocalleader = " "

-- LSP
require "lsp"

-- Personal config
require "basic"

-- GUI Config
require "guis"
