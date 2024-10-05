local Treesitter = require("config").Treesitter

require("nvim-treesitter.configs").setup({
  modules = {},
  ensure_installed = Treesitter.parsers,
  auto_install = false,
  sync_install = false,
  ignore_install = {},

  indent = {
    enable = true,
    disable = { 'python', 'kotlin', 'dart' },
  },
  matchup = { enable = true },

  highlight = {
    enable = true,
    disable = function(lang, bufnr)
      for _, disabled_lang in ipairs(Treesitter.disabled) do
        if lang == disabled_lang then
          return true
        end
      end

      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
      if ok and stats and stats.size > max_filesize then
        return true
      end

      if vim.api.nvim_buf_line_count(bufnr) > 50000 then
        return true
      end
    end,
    additional_vim_regex_highlighting = { "latex", "tex", "org", "html", "swift", "kitty" },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "gnrr",
      scope_incremental = "gnrc",
      node_decremental = "gnrm",
    },
  },
  refactor = {
    highlight_definitions = { enable = true },
    navigation = {
      enable = true,
      keymaps = {
        list_definitions_toc = "gO",
      },
    },
    smart_rename = {
      enable = true,
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        ["ir"] = "@parameter.inner",
        ["ar"] = "@parameter.outer",

        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
      },
    },
    move = {
      enable = true,
      disable = { "org" },
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  pairs = {
    enable = true,
    disable = {},
    highlight_pair_events = {},
    highlight_self = false,
    goto_right_end = false,
    fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')",
    keymaps = {
      goto_partner = "%",
    },
  },
  autotag = {
    enable = true,
    enable_close_on_slash = false,
  },
  autopairs = {
    enable = true,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  endwise = {
    enable = true,
  },
})
