vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.makeprg = "javac %"

vim.api.nvim_buf_set_keymap(0, 'n', '<localleader><leader>r', ':!java -cp %:p:h %:t:r<cr>', { noremap = true })

local jdtls = require('jdtls')
local root_markers = {'gradlew', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv("HOME")
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local on_attach = require("lsp.primary.on_attach")

-- See mfussenegger/dotfiles for more inspiration
-- vim/.config/nvim/ftplugin/java.lua
local config = {
  cmd = {
    '/usr/bin/jdtls',
    '-configuration', '/usr/share/java/jdtls/config_linux',
    '-data', workspace_folder
  },
  root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
  settings = {
    java = {
      inlayHints = {
        parameterNames = {
          enabled = "all",
        },
      },
    },
  },
  init_options = {
    bundles = {}
  },
  on_attach = on_attach,
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
