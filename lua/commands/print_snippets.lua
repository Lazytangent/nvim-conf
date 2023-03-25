local keys = {
    "trigger",
    --[[ "dscr", ]]
    "id",
    "name",
    --[[ "docstring", ]]
    --[[ "condition", ]]
}

local first_to_upper = function(str)
    return (str:gsub("^%l", string.upper))
end

local create_line = function(keys)
    local content = ""
    for _, key in ipairs(keys) do
        local piece = string.format("%-15s", key)
        content = content .. "| " .. piece .. " "
    end

    return content
end

local create_headline = function(keys)
    local titlecased_keys = {}
    for _, key in ipairs(keys) do
        table.insert(titlecased_keys, first_to_upper(key))
    end

    return create_line(titlecased_keys)
end

vim.api.nvim_create_user_command('DescribeSnippetsTable', function(args)
  local filetype = vim.bo.filetype
  local snippets = require('luasnip').get_snippets(filetype, { type = "snippets" })

  local headline = create_headline(keys)
  print(headline)
  print(("-"):rep(string.len(headline)))
  for _, snippet in ipairs(snippets) do
      local snippet_table = {}
      for _, key in ipairs(keys) do
          table.insert(snippet_table, snippet[key])
      end
      print(create_line(snippet_table))
  end
end, {})
