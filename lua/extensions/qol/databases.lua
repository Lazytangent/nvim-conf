return {
  {
    'kndndrj/nvim-dbee',
    dependencies = {
      "MunifTanji/nui.nvim",
    },
    build = function()
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup {
        sources = {
          require("dbee.sources").MemorySource:new(
            require("user.database.utils").parse_databases_from_env(true)
          ),
          require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
          require("dbee.sources").FileSource:new(vim.fn.stdpath("state") .. "/dbee/persistence.json"),
        },
      }
    end,
  },

  "tpope/vim-dadbod",
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = "DBUI",
    init = function()
      vim.g.db_ui_tmp_query_location = '~/.local/share/queries'
      vim.g.db_ui_winwidth = 60
    end,
  },
  "kristijanhusak/vim-dadbod-completion",
}
