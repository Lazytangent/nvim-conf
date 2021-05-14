" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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

time("Luarocks path setup", true)
local package_path_str = "/Users/petermai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/petermai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/petermai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/petermai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/petermai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ale = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["dragvisuals.vim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/dragvisuals.vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["moonlight.vim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/moonlight.vim"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["org.vim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/org.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["typscript-vim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/typscript-vim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dotenv"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-dotenv"
  },
  ["vim-easytags"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-easytags"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-flake8"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-flake8"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-fugitive"
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
  ["vim-js"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-js"
  },
  ["vim-jsdoc"] = {
    commands = { "make install" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/opt/vim-jsdoc"
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
  ["vim-misc"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-misc"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-prisma"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-prisma"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-repeat"
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
  ["vim-virtualenv"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-virtualenv"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  vimtex = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/petermai/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time("Defining packer_plugins", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file make install lua require("packer.load")({'vim-jsdoc'}, { cmd = "make install", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType ts ++once lua require("packer.load")({'vim-jsdoc'}, { ft = "ts" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'vim-jsdoc'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsx ++once lua require("packer.load")({'vim-jsdoc'}, { ft = "tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType js ++once lua require("packer.load")({'vim-jsdoc'}, { ft = "js" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
