return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      disable_insert_on_commit = true,
      mappings = {
        status = {
          ["]]"] = "NextSection",
          ["[["] = "PreviousSection",
        },
      },
      kind = "split_below_all",
    },
    event = "VeryLazy",
  },
  { "tpope/vim-fugitive" },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      view = {
        merge_tool = {
          -- diff1_plain
          -- diff3_horizontal
          -- diff4_mixed
          layout = "diff3_mixed",
        },
      },
      keymaps = {
        view = {
          { "n", "q", function() require("diffview.actions").close() end, { desc = "Close help menu" } },
        },
        file_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close help menu" } },
        },
        file_history_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close help menu" } },
        },
      },
    },
  },
  {
    "ruifm/gitlinker.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    'claydugo/browsher.nvim',
    event = 'VeryLazy',
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
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
        map('n', '<leader>gtp', gs.preview_hunk)
        map('n', '<leader>gd', gs.diffthis)
        map('n', '<leader>gD', function() gs.diffthis('~') end)
        map('n', '<leader>gtd', gs.toggle_deleted)

        -- Text object
        map({'o', 'x'}, 'ih', '<cmd>Gitsigns select_hunk<cr>')
      end,
    },
  },
  {
    'NicolasGB/jj.nvim',
    opts = true,
  },
}
