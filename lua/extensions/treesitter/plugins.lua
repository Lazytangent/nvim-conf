return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = 'main',
    config = function()
      vim.g.skip_ts_context_commentstring_module = true
      require 'extensions.treesitter.configs.treesitter'

      -- require 'extensions.treesitter.configs.http-parser'
    end,
  },
  -- "nvim-treesitter/nvim-treesitter-refactor",
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = 'main',
    config = true,
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
      languages = {
        javascript = {
          __default = '// %s',
          jsx_element = '{/* %s */}',
          jsx_fragment = '{/* %s */}',
          jsx_attribute = '// %s',
          comment = '// %s',
        },
      },
    },
  },
  -- "RRethy/nvim-treesitter-endwise",
  -- "theHamsta/nvim-treesitter-pairs",
  "windwp/nvim-ts-autotag",
  -- "phelipetls/jsonpath.nvim",
  {
    "yioneko/vim-tmindent",
    config = function()
      require 'extensions.treesitter.configs.tmindent'
    end,
  },
  {
    "David-Kunz/treesitter-unit",
  },
  {
    url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git",
    main = 'rainbow-delimiters.setup',
    config = true,
  },
}
