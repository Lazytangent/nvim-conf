local group = vim.api.nvim_create_augroup("CustomGroups", {})

local autocmds = {
  -- Highlight on yank
  {'TextYankPost', { callback = function() require('vim.hl').on_yank() end, group = group }},

  -- Remember cursor position
  {'BufEnter', { callback = function()
    if
      vim.fn.line("'\"") >= 1 and
      vim.fn.line("'\"") <= vim.fn.line("$") and
      vim.bo.filetype ~= "gitcommit" and
      vim.bo.filetype ~= "commit" and
      vim.fn.index({'xxd', 'gitrebase'}, vim.bo.filetype) == -1
    then
      vim.cmd [[exec "normal! g'\""]]
    end
  end, group = group }},

  -- Remove trailing whitespace
  {'BufWritePre', { command = [[%s/\s\+$//e]], group = group }},
  {'BufWritePre', { command = [[%s/\n\+\%$//e]], group = group }},

  -- Terminal buffer defaults
  {'TermOpen', { command = [[setlocal filetype=terminal nonumber norelativenumber bufhidden="delete"]], group = group }},
  -- {'TermOpen', { command = 'startinsert', group = group }},

  -- Update file if file has been updated outside of buffer
  {{'FocusGained', 'BufEnter'}, { command = 'checktime', group = group }},
  {'StdinReadPre', { command = [[let s:std_in=1]], group = group }},

  -- LuaSnip get out of nodes
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
      group = group,
    },
  },

  -- Disables spellcheck in quickfix list
  {'BufReadPost', { command = [[setlocal nospell]], pattern = 'quickfix', group = group }},

  -- Try orgmode meta-return with Shift-Return in insert mode. (Didn't work in
  -- Alacritty)
  {'FileType', { pattern = 'org', callback = function()
    vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<cr>', {
      silent = true,
      buffer = true,
    })
  end}},
}

for _, cmd in ipairs(autocmds) do
  local event = cmd[1]
  local opts = cmd[2]

  vim.api.nvim_create_autocmd(event, opts)
end
