vim = vim
local utils = {}
local scopes = {g = vim.go, o = vim.o, b = vim.bo, w = vim.wo}

-- options
function utils.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= "o" then
    scopes["o"][key] = value
  end
end

-- mappings
function utils.map(mode, key, result, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, key, result, options)
end

-- Telescope
function utils.search_nvim()
  require("telescope.builtin").find_files(
    {
      prompt_title = "Neovim Config",
      cwd = "$HOME/.config/nvim/lua"
    }
  )
end

return utils
