local Buffer = require('user.lib.buffer')

local M = {}
local buffers = {}

-- create buffer
M.create_abbrev_buffer = function()
  local buffer = Buffer.create {
    name = "Abbrevs",
    kind = "split_below",
  }
  buffers[buffer.handle] = buffer
  return buffer
end

-- remove buffer (and local abbrevs)
M.remove_abbrev_buffer = function()

end

-- apply abbrevs when leaving buffer (AutoCmd event?)
---@param abbrevs table
M.apply_abbrevs = function(abbrevs)

end

return M
