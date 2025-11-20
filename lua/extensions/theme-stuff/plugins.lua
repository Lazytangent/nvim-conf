local parent_module = (...):match("(.-)[^%.]+$")

local modules = {}
local children = {
  'catppuccin',
  'citruszest',
  'lualine',
  'oasis',
  'onedark',
  'oxocarbon',
  'tokyonight',
}

for _, name in ipairs(children) do
  table.insert(modules, require(parent_module .. name))
end

return modules
