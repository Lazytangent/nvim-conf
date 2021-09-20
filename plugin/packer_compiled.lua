-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/petermai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/petermai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/petermai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/petermai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/petermai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Catppuccino.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/Catppuccino.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["dragvisuals.vim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/dragvisuals.vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  ["moonlight.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/moonlight.nvim"
  },
  ["neoterm.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/neoterm.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nf\0\0\3\0\5\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\1\0009\0\4\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14lspconfig\vconfig\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-gps"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-gps"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-terminal.lua"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-terminal.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-pairs"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-treesitter-pairs"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["orgmode.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/registers.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/sqlite.lua"
  },
  tagbar = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/typescript-vim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dbml"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-dbml"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-dotenv"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-dotenv"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-elixir"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-heroku"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-heroku"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-instant-markdown"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-instant-markdown"
  },
  ["vim-jsdoc"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-jsdoc"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
  },
  ["vim-jsx-typescript"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-jsx-typescript"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-prisma"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-prisma"
  },
  ["vim-pug"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-pug"
  },
  ["vim-ragtag"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-ragtag"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-sort-motion"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-sort-motion"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tailwindcss"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-tailwindcss"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  vimtex = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nf\0\0\3\0\5\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\1\0009\0\4\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14lspconfig\vconfig\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
