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

  local bufnr = vim.api.nvim_create_buf(false, true)

  local headline = create_headline(keys)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { headline })
  local break_ = ("-"):rep(string.len(headline))
  vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, { break_ })

  for _, snippet in ipairs(snippets) do
      local snippet_table = {}
      for _, key in ipairs(keys) do
          table.insert(snippet_table, snippet[key])
      end
      local line = create_line(snippet_table)
    vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, { line })
  end

  vim.cmd.vsplit()
  vim.api.nvim_win_set_buf(0, bufnr)
  vim.cmd("%:EasyAlign *|")

end, {})

vim.api.nvim_create_user_command('ListSnippets', function()
  local sl = require('luasnip.extras.snippet_list')
  local function printer(snippets)
    local res = ""

    for ft, snips in pairs(snippets) do
      res = res .. ft .. "\n"
      for _, snip in pairs(snips) do
        res = res .. "    " .. "Name: " .. snip.name .. "\n"
        res = res .. "    " .. "Desc: " .. snip.description[1] .. "\n"
        res = res .. "    " .. "Trigger: " .. snip.trigger .. "\n"
        res = res .. "    ----" .. "\n"
      end
    end

    return res
  end

  sl.open({ printer = printer })
end, {})
