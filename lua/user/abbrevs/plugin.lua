local M = {}
local buffer = -1
local window

-- create buffer
M.create_abbrev_buffer = function()
  if buffer == -1 then
    buffer = vim.api.nvim_create_buf(false, false)
    vim.api.nvim_buf_set_name(buffer, "Abbrevs")
    vim.api.nvim_set_option_value('swapfile', false, { buf = buffer })
    vim.api.nvim_set_option_value('buftype', 'nofile', { buf = buffer })
  end

  window = vim.api.nvim_open_win(buffer, true, {
    split = "below",
    height = 10,
  })

  vim.api.nvim_create_autocmd('BufLeave', {
    buffer = buffer,
    callback = function()
      M.apply_abbrevs()
    end,
  })
  return buffer
end

local delimiters = {
  -- squote
  ["'"] = "'",
  -- dquote
  ['"'] = '"',
}

---@param line string
---@return nil|table
local function parse_quoted_strings(line)
  if #line == 0 then
    -- return nil when the line has no length
    return nil
  end

  -- expect first delimiter to be first char
  local first_delimiter = line:sub(1, 1)

  -- find matching pair to first delimiter
  local close_char = delimiters[first_delimiter]
  if close_char == nil then
    local space_idx = line:find(' ')
    if space_idx == nil then
      return nil
    end

    local short = line:sub(1, space_idx - 1)
    local long_start = line:find('[^%s]', space_idx + 1)
    if long_start == nil then
      vim.notify('Missing second word')
      return nil
    end
    local long = line:sub(long_start)
    return { short, long }
  end

  local close_idx = line:find(close_char, 2)

  local rest = line:sub(close_idx + 1)
  local second_start_idx = rest:find("[^%s]")
  if second_start_idx == nil then
    vim.notify('Missing second word')
    return nil
  end
  local second_start_char = rest:sub(second_start_idx, second_start_idx)
  local second_close_char = delimiters[second_start_char]
  local second_close_idx = rest:find(second_close_char, second_start_idx + 1)

  local first = line:sub(2, close_idx - 1)
  local second = rest:sub(second_start_idx + 1, second_close_idx - 1)

  return { first, second }
end

local abbrevs = {}

M.apply_abbrevs = function()
  local number_of_lines = vim.api.nvim_buf_line_count(buffer)
  local lines = vim.api.nvim_buf_get_lines(buffer, 0, number_of_lines, false)

  local curr_abbrevs = {}
  for _, line in ipairs(lines) do
    if #line ~= 0 then
      local split = parse_quoted_strings(line)
      if split ~= nil then
        local short = split[1]
        local long = split[2]
        curr_abbrevs[short] = long

        local cmd = "Abolish " .. short .. " " .. long
        -- print(cmd)
        vim.cmd(cmd)
      end
    end
  end

  -- remove any abbrevs no longer in the Abbrevs buffer
  for short, _ in pairs(abbrevs) do
    if curr_abbrevs[short] == nil then
      local cmd = "Abolish -delete " .. short
      -- print(cmd)
      vim.cmd(cmd)
    end
  end

  abbrevs = curr_abbrevs
end

vim.api.nvim_create_user_command('Abbrevs',
  function(o)
    if #o.fargs == 0 then
      M.create_abbrev_buffer()
      return
    end

    M[o.fargs[1]]()
  end, {
    nargs = "*",
    complete = function(arglead)
      return vim.tbl_filter(function(arg)
        return arg:match("^" .. arglead)
      end, {
        "apply_abbrevs",
        "create_abbrev_buffer",
      })
    end,
  }
)

return M
