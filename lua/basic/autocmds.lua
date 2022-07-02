local autocmds = {
  -- Highlight on yank
  {'TextYankPost', { callback = function() require('vim.highlight').on_yank() end }},
  -- Remember cursor position
  {'BufReadPost', { command = [[if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'gitcommit' | exe "normal! g'\"" | endif]] }},
  -- Remove trailing whitespace
  {'BufWritePre', { command = [[%s/\s\+$//e]] }},
  {'BufWritePre', { command = [[%s/\n\+\%$//e]] }},
  -- Terminal buffer defaults
  {'TermOpen', { command = [[setlocal filetype=terminal nonumber norelativenumber bufhidden="delete"]] }},
  {'TermOpen', { command = 'startinsert' }},
  -- Update file if file has been updated outside of buffer
  {{'FocusGained', 'BufEnter'}, { command = 'checktime' }},
  {'StdinReadPre', { command = [[let s:std_in=1]] }},
  {'ModeChanged',
    {
      callback = function()
        local luasnip = require('luasnip')
        if
          ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
          and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
          and not luasnip.session.jump_active
        then
          luasnip.unlink_current()
        end
      end,
    },
  },
  {'BufReadPost', { command = [[setlocal nospell]], pattern = 'quickfix' }}
}

for _, cmd in ipairs(autocmds) do
  local event = cmd[1]
  local opts = cmd[2]

  vim.api.nvim_create_autocmd(event, opts)
end
