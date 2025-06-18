vim.api.nvim_create_user_command("Term", function(opts)
  if #opts.fargs == 0 then
    -- Defaults to height of 25
    vim.cmd "25split | term"
    return
  end

  local fargs = opts.fargs
  local first = fargs[1]

  local as_number = tonumber(first)
  if as_number then
    -- if the arg is a number, then we split using it as the height
    vim.cmd(as_number .. "split | term")
    return
  end

  -- if an arg was provided but wasn't a number, then do something special
  local lowercased = string.lower(first)
  if lowercased == "half" then
    vim.cmd "split | term"
    return
  else
    local current_window_height = vim.api.nvim_win_get_height(0)
    local divisor = 0

    if lowercased == "third" then
      divisor = 3
    elseif lowercased == "fourth" then
      divisor = 4
    end

    if divisor ~= 0 then
      vim.cmd(math.floor(current_window_height / divisor) .. "split | term")
    end
  end
end, {
  nargs = '?',
})
