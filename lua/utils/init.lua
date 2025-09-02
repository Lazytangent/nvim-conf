local utils = {}

utils.join_paths = function(...)
  local separator = utils.get_separator()
  return table.concat({ ... }, separator)
end

utils.get_separator = function()
  return '/'
end

return utils
