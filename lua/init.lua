-- Set up Lazy
require "utils.load_lazy"

-- Set up Leader and Local leader mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " m"

-- Disable netrw in favor of oil.nvim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use GUI Pinentry for signing GPG keys
vim.env.PINENTRY_USER_DATA = 'USE_QT'

-- Load in extensions
require "extensions"
require "mappings"

-- Configure LSP
require "lsp"

-- Personal config stuff
require "basic"
require "commands"

-- GUI Config
require "guis"

require "user.abbrevs.plugin"
require "user.hydras"

-- Start Cfilter for Quickfix list
vim.api.nvim_command "packadd! cfilter"
