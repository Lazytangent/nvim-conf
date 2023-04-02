local lazy = require('lazy')

local lazy_opts = {
  concurrency = 50,
  dev = {
    path = "~/.local/src/neovim-plugins",
  },
}

local theme_stuff = require 'extensions.theme-stuff.plugins'
local treesitter = require 'extensions.treesitter.plugins'
local lsp = require 'extensions.lsp.plugins'
local dap = require 'extensions.dap.plugins'
local languages = require 'extensions.languages.plugins'
local qol = require 'extensions.quality-of-life.plugins'
local dadbod = require 'extensions.dadbod.plugins'
local telescope = require 'extensions.telescope.plugins'
local custom = require 'extensions.custom.plugins'

local plugins = {
  theme_stuff,
  treesitter,
  lsp,
  dap,
  languages,
  qol,
  dadbod,
  telescope,
  custom,
}

lazy.setup(plugins, lazy_opts)
