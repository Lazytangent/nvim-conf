vim.cmd.iabbrev({ "pln", 'println!("' })
vim.cmd.iabbrev({ "sfm", 'String::from("' })

vim.api.nvim_buf_create_user_command(0, "CargoRun", function()
  vim.schedule(function()
    local bufnr = vim.api.nvim_create_buf(true, true)

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "output of: cargo run ." })
    vim.fn.jobstart({ "cargo", "run", "." }, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
        end
      end,
      on_stderr = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
        end
      end,
    })

    vim.cmd.vsplit()
    vim.api.nvim_win_set_buf(0, bufnr)

    local windows = vim.api.nvim_list_wins()
    local current_win = vim.api.nvim_get_current_win()

    for _, win in ipairs(windows) do
      if win ~= current_win then
        vim.api.nvim_set_current_win(win)
        break
      end
    end
  end)
end, {})

vim.api.nvim_buf_create_user_command(0, "CargoTest", function()
  vim.schedule(function()
    local bufnr = vim.api.nvim_create_buf(true, true)

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "output of: cargo test" })
    vim.fn.jobstart({ "cargo", "test" }, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
        end
      end,
      on_stderr = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
        end
      end,
    })

    vim.cmd.vsplit()
    vim.api.nvim_win_set_buf(0, bufnr)

    local windows = vim.api.nvim_list_wins()
    local current_win = vim.api.nvim_get_current_win()

    for _, win in ipairs(windows) do
      if win ~= current_win then
        vim.api.nvim_set_current_win(win)
        break
      end
    end
  end)
end, {})
