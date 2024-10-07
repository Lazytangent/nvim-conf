local utils = {}

-- Telescope
function utils.search_nvim()
  require("telescope.builtin").find_files(
    {
      prompt_title = "Neovim Config",
      cwd = "$HOME/.config/nvim/lua"
    }
  )
end

function utils.load_modules(base, modules)
  for _, module in ipairs(modules) do
    require(base .. "." .. module)
  end
end

return utils
