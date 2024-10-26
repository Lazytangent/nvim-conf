local parentModule = (...):match("(.-)[^%.]+$")

local modules = {}
local children = {
  'catppuccin',
  'lualine',
  'onedark',
  'oxocarbon',
  'tokyonight',
}

for _, name in ipairs(children) do
  table.insert(modules, require(parentModule .. name))
end

return modules
