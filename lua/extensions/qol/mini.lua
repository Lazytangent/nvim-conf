local set_quickfixlist = function()
  local matches = MiniPick.get_picker_matches()
  local list = {}

  -- Only works for files
  -- See mini.pick source for how to handle other types based on
  -- `default_choose_marked`
  for _, match in ipairs(matches.all) do
    local entry = {
      filename = match,
    }
    table.insert(list, entry)
  end
  local list_data = {
    items = list,
    title = 'List',
    nr = '$',
  }

  vim.fn.setqflist({}, ' ', list_data)
  vim.cmd.copen()
  vim.api.nvim_win_call(
    MiniPick.get_picker_state().windows.target,
    function() vim.cmd.crewind() end
  )
  return true
end

-- will allow me to `require` configs per module later
local configs = {
  ai = true,
  align = true,
  bracketed = true,
  extra = true,
  pick = {
    mappings = {
      choose_marked = '<C-CR>',
      set_quickfixlist = {
        char = '<C-q>',
        func = set_quickfixlist,
      },
    },
    options = {
      content_from_bottom = true,
    },
  },
}

local function setup()
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
  config = setup,
}
