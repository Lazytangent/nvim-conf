local util = require('utils')
local lazy_completion = require('lazy.view.commands')

local M = {}

M.rm_dir = function(path)
  local handle = vim.loop.fs_scandir(path)

  if type(handle) == "string" then
    return vim.notify(handle, vim.log.levels.ERROR)
  end

  while true do
    local name, t = vim.loop.fs_scandir_next(handle)
    if not name then
      break
    end

    local new_cwd = util.join_paths(path, name)
    if t == "directory" then
      local success = M.rm_dir(new_cwd)
      if not success then
        return false
      end
    else
      local success = vim.loop.fs_unlink(new_cwd)
      if not success then
        return false
      end
    end
  end

  return vim.loop.fs_rmdir(path)
end

local nuke = function()
  vim.notify(
    "Warning, this command deletes all of your plugins and causes a re-install on next launch."
  )

  local plugin_dir = util.join_paths(vim.fn.stdpath("data"), "site", "pack")
  M.rm_dir(plugin_dir)
  vim.notify("Plugins have been nuked. Packer will re-install itself, but you'll probably have to reinstall the plugins yourself by running :PackerSync")
end

local nuke_plugin = function(opts)
  local plugin = opts.fargs[1]

  local plugin_dir = util.join_paths(vim.fn.stdpath("data"), "site", "pack", "packer")
  local matching_paths = vim.fs.find(plugin, { path = plugin_dir })

  -- Check for empty matching paths
  local path = matching_paths[1]
  if path == nil then
    print("No matching plugin found")
  end

  M.rm_dir(path)
  print("Plugin " .. plugin .. " has been nuked. You can reinstall it by running :PackerSync")
end

local reinstall_plugin = function(opts)
  nuke_plugin(opts)

  vim.cmd [[PackerSync]]
end

vim.api.nvim_create_user_command("NukePlugins", nuke, {})
vim.api.nvim_create_user_command("NukePlugin", nuke_plugin, {
  nargs = 1,
  complete = lazy_completion.complete,
})

vim.api.nvim_create_user_command("ReinstallPlugin", reinstall_plugin, {
  nargs = 1,
  complete = lazy_completion.complete,
})
