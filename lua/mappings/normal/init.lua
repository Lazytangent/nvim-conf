local parent_module = (...):match("(.-)[^%.]+$")
local current_module = parent_module .. 'normal.'

local spec = {
  { "#",      "#``", desc = "#" },
  { "*",      "*``", desc = "*" },

  { "j", "v:count == 0 ? 'gj' : 'j'", desc = "Up (virtual) line",   expr = true },
  { "k", "v:count == 0 ? 'gk' : 'k'", desc = "Down (virtual) line", expr = true },

  { "K", desc = "Hover" }, -- LSP on_attach

  require(current_module .. 'ctrl'),
  require(current_module .. 'leader'),
  require(current_module .. 'localleader'),
  require(current_module .. 'c'),
  require(current_module .. 'g'),
  require(current_module .. 'y'),
  -- require(current_module .. 'brackets'),
}

return spec
