local M = {}

M.today = function ()
  local today = os.date("%Y-%m-%d")
  require("org-roam").ext.dailies.goto_date({ date = today }):next(function(date)
    if date then
      print("Opened date " .. date:to_string())
    end
  end)
end

---@param prefix? string
M.find = function(prefix)
  require("org-roam").api.find_node({ title = prefix })
end

---@param title? string
M.capture = function(title)
  require('org-roam').api.capture_node({ title = title })
end

vim.api.nvim_create_user_command("RoamToday", M.today, {})

M.roam_cmd = function(o)
  if o.fargs[1] == "today" then
    M.today()
  elseif o.fargs[1] == "find" then
    M.find(o.fargs[2])
  elseif o.fargs[1] == "capture" then
    M.capture(o.fargs[2])
  end
end

vim.api.nvim_create_user_command("Roam", M.roam_cmd, {
  nargs = '*',
  complete = function(arglead)
    return vim.tbl_filter(function(arg)
      return arg:match("^" .. arglead)
    end, {
      "today",
      "find",
      "capture",
    })
  end,
})
