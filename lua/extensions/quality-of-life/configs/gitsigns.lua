require('gitsigns').setup {
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '¯' },
    changedelete = { text = '~' },
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
      if vim.wo.diff then return ']h' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end)

    map('n', '[h', function()
      if vim.wo.diff then return '[h' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end)

    --[[ -- Actions ]]
    map('n', '<localleader>gp', gs.preview_hunk)
    map('n', '<localleader>gd', gs.diffthis)
    map('n', '<localleader>gD', function() gs.diffthis('~') end)
    map('n', '<localleader>gtd', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', '<cmd>Gitsigns select_hunk<cr>')
  end,
}
