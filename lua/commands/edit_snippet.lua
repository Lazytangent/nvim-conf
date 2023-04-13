vim.api.nvim_create_user_command("EditSnippets", function()
  require("luasnip.loaders").edit_snippet_files({})
end, {})
