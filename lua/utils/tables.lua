local M = {}

-- @param tbl1 table (sequential)
-- @param tbl2 table (sequential)
-- @return table (sequential)
M.concatenate_sequential_tables = function(tbl1, tbl2)
  local new_table = {}
  for _, v in ipairs(tbl1) do
    table.insert(new_table, v)
  end
  for _, v in ipairs(tbl2) do
    table.insert(new_table, v)
  end
  return new_table
end

return M
