require('gitsigns').setup {
  signs = {
    add          = { hl = 'GitGutterAdd',    text = '+' },
    change       = { hl = 'GitGutterChange', text = '~' },
    delete       = { hl = 'GitGutterDelete', text = '_' },
    topdelete    = { hl = 'GitGutterDelete', text = '¯' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']h', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end)

    map('n', '[h', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end)

    -- Actions
    map('n', '<localleader>gp', gs.preview_hunk)
    map('n', '<localleader>gd', gs.diffthis)
    map('n', '<localleader>gD', function() gs.diffthis('~') end)
    map('n', '<localleader>gtd', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', '<cmd>Gitsigns select_hunk<cr>')
  end,
}
