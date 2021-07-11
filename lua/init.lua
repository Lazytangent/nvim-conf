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
require "plugins.mappings"
require "plugins.which-key"
require "plugins.treesitter"
require "plugins.nerdtree"
require "plugins.telescope"

-- Personal config
require "basic"
