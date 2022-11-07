local Treesitter = require("config").Treesitter

require("nvim-treesitter.configs").setup({
  ensure_installed = Treesitter.parsers,

  indent = {
    enable = false,
    disable = { 'python' },
  },
  matchup = { enable = true },
  rainbow = { enable = Treesitter.rainbow, extended_mode = true },

  highlight = {
    enable = true,
    disable = Treesitter.disabled,
    -- disable = function(lang, bufnr)
    --   for _, disabled_lang in ipairs(Treesitter.disabled) do
    --     if lang == disabled_lang then
    --       return true
    --     end
    --   end

    --   if vim.api.nvim_buf_line_count(bufnr) > 50000 then
    --     return true
    --   end
    -- end,
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
  playground = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s',
      },
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        ["acl"] = "@class.outer",
        ["icl"] = "@class.inner",

        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",

        ["ico"] = "@conditional.inner",
        ["aco"] = "@conditional.outer",

        ["ir"] = "@parameter.inner",
        ["ar"] = "@parameter.outer",

        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<localleader>b"] = "@block.outer",
        ["<localleader>m"] = "@function.outer",
        ["<localleader>c"] = "@class.outer",
      },
      swap_previous = {
        ["<localleader>B"] = "@block.outer",
        ["<localleader>M"] = "@function.outer",
        ["<localleader>C"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ["<localleader>df"] = "@function.outer",
        ["<localleader>dc"] = "@class.outer",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
        ["]g"] = "@block.outer",
        ["]c"] = "@conditional.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
        ["]G"] = "@block.outer",
        ["]C"] = "@conditional.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
        ["[g"] = "@block.outer",
        ["[c"] = "@conditional.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
        ["[G"] = "@block.outer",
        ["[C"] = "@conditional.outer",
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
  yati = {
    enable = true,
    default_fallback = function(lnum, computed, bufnr)
      if vim.tbl_contains(tm_fts, vim.bo[bufnr].filetype) then
        return require('tmindent').get_indent(lnum, bufnr) + computed
      end

      return require('nvim-yati.fallback').vim_auto(lnum, computed, bufnr)
    end,
  },
})

require 'extensions.treesitter.http_parser'
require 'extensions.treesitter.context'
