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
require "plugins.which-key"
require "plugins.treesitter"
require "plugins.nvim-tree"
require "plugins.telescope"

-- Personal config
require "basic"
