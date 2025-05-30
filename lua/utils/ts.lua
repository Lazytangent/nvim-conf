-- Tree-Sitter Utils

local M = {}

-- @param lang string language tree-sitter will be parsing in
-- @param table table of queries
-- @return string|nil
M.find_match = function(lang, table)
  local node = vim.treesitter.get_node()
  if node == nil then
    vim.notify("Node was nil")
    return nil
  end
  local tree = node:tree()
  local root_node = tree:root()
  local last = root_node

  for _, query_str in ipairs(table) do
    local query = vim.treesitter.query.parse(lang, query_str)
    local i = 0

    for idx, curr, _, _ in query:iter_captures(root_node, 0) do
      i = idx
      local text = vim.treesitter.get_node_text(curr, 0)

      if not string.match(text, "[%/%.%:]") then
        last = curr
      end
    end

    if i == 0 then
      -- Didn't find any captures and stayed on root
      goto continue
    end

    local last_text = vim.treesitter.get_node_text(last, 0)
    if last_text ~= nil then
      return last_text
    end

    ::continue::
  end

  return nil
end

return M
