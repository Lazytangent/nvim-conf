local lazy = require('lazy')

local lazy_opts = {
  concurrency = 50,
  dev = {
    path = "~/.local/src/neovim-plugins",
  },
}

local items = {
  'theme-stuff',
  'treesitter',
  'lsp',
  'dap',
  'languages',
  'quality-of-life',
  'dadbod',
  'telescope',
  'custom',
}

local plugins = {}

for _, item in ipairs(items) do
  local config = require('extensions.' .. item .. '.plugins')
  table.insert(plugins, config)
end

lazy.setup(plugins, lazy_opts)
