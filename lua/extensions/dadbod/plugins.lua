return {
  "tpope/vim-dadbod",
  {
    "kristijanhusak/vim-dadbod-ui",
    init = function()
      vim.g.db_ui_env_variable_url = 'DATABASE_URL'
      vim.g.db_ui_env_variable_name = 'DATABASE_NAME'
    end,
    cmd = "DBUI",
  },
  "kristijanhusak/vim-dadbod-completion",
}
