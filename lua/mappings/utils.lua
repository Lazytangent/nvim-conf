local utils = {}

utils.cmd = function(command)
  return table.concat({ "<cmd>", command, "<cr>"})
end

utils.lua_require = function(module, func)
  return utils.cmd(table.concat({ "lua require('", module, "').", func }))
end

utils.telescope_builtin = function(func)
  return utils.lua_require("telescope.builtin", func)
end

utils.telescope_extensions = function(func)
  return utils.lua_require("telescope", table.concat({ "extensions.", func }))
end

utils.extensions_telescope = function(func)
  return utils.lua_require("extensions.telescope", func)
end

utils.gitsigns = function(func)
  return utils.lua_require("gitsigns", func)
end

return utils
