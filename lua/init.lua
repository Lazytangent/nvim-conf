-- Set up Lazy
require "utils.lazy"

-- Set up Leader and Local leader mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " m"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load in extensions
require "extensions"

-- Configure LSP
require "lsp"

-- Personal config stuff
require "basic"
require "commands"

-- GUI Config
require "guis"

-- Start Cfilter for Quickfix list
vim.api.nvim_command "packadd! cfilter"
