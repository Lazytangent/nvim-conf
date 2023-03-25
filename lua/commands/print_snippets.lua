vim.api.nvim_create_user_command('DescribeSnippetsTable', function(args)
  local filetype = vim.bo.filetype

  print(vim.inspect(require('luasnip').get_snippets(filetype, { type = "snippets" })))
end, {})
