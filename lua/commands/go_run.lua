vim.api.nvim_create_user_command("GoRun", function()
  vim.schedule(function()
    local bufnr = vim.api.nvim_create_buf(true, false)

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "output of: main.go" })
    vim.fn.jobstart({ "go", "run", "." }, {
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
  end)
end, {})
