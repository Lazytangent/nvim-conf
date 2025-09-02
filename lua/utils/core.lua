local utils = {}

function utils.load_modules(base, modules)
  for _, module in ipairs(modules) do
    require(base .. "." .. module)
  end
end

return utils
