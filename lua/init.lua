-- Set up Lazy
require "utils.lazy"

-- Set up Leader and Local leader mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " m"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use GUI Pinentry for signing GPG keys
vim.env.PINENTRY_USER_DATA = 'USE_QT'

-- TODO: Temp fix until `typescript-tools.nvim` merges in fix for Issue #266
vim.tbl_add_reverse_lookup = function (tbl)
  for k, v in pairs(tbl) do
    tbl[v] = k
  end
end

-- Load in extensions
require "extensions"

-- Configure LSP
-- require "lsp"

-- Personal config stuff
require "basic"
require "commands"

-- GUI Config
-- require "guis"

-- Start Cfilter for Quickfix list
vim.api.nvim_command "packadd! cfilter"

if vim.g.vscode then
  require "vscode_settings"
end
