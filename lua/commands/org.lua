vim.api.nvim_create_user_command("OrgAgenda", function()
  require("orgmode").action("agenda.prompt")
end, {})

vim.api.nvim_create_user_command("RoamToday", function ()
  local today = os.date("%Y-%m-%d")
  require("org-roam").ext.dailies.goto_date({ date = today }):next(function(date)
    if date then
      print("Opened date " .. date:to_string())
    end
  end)
end, {})
