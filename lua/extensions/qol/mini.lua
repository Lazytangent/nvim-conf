-- will allow me to `require` configs per module later
local configs = {
  ai = true,
  align = true,
  bracketed = true,
  pick = true,
}

local function setup_mini()
  for module, config in pairs(configs) do
    local full_module_name = 'mini.' .. module

    if config == true then
      require(full_module_name).setup()
    else
      require(full_module_name).setup(config)
    end
  end
end

return {
  'nvim-mini/mini.nvim',
  config = setup_mini,
}
