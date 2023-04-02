local lazy = require('lazy')

local lazy_opts = {
  concurrency = 50,
  dev = {
    path = "~/.local/src/neovim-plugins",
  },
}

local items = {
  'custom',
  'dadbod',
  'dap',
  'languages',
  'lsp',
  'quality-of-life',
  'telescope',
  'theme-stuff',
  'treesitter',
}

local plugins = {}

for _, item in ipairs(items) do
  local config = require('extensions.' .. item .. '.plugins')
  table.insert(plugins, config)
end

lazy.setup(plugins, lazy_opts)
