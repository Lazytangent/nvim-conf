return {
  {
    'kndndrj/nvim-dbee',
    dependencies = {
      "MunifTanji/nui.nvim",
    },
    build = function()
      require("dbee").install()
    end,
    config = true,
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
