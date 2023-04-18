vim.api.nvim_create_user_command("OrgAgenda", function()
  require("orgmode").action("agenda.prompt")
end, {})
