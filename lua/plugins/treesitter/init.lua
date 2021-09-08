require("nvim-treesitter.configs").setup({
  ensure_installed = Treesitter.parsers,
  -- ignore_install = { "latex" },

  indent = { enable = false },
  matchup = { enable = true },
  rainbow = { enable = Treesitter.rainbow, extended_mode = true },

  highlight = {
    enable = true,
    disable = { "latex", "tex" },
    additional_vim_regex_highlighting = { "latex", "tex", "org" },
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
    highlight_current_scope = { enable = true },
    navigation = {
      enable = true,
      keymaps = {
        list_definitions_toc = "gO",
      },
    },
  },
  playground = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
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

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
    move = {
      enable = true,
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
      goto_previous_start = {
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
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
})

require 'plugins.treesitter.org_parser'
