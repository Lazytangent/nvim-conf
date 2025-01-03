return {
  {
    'lifepillar/pgsql.vim',
    init = function()
      vim.g.sql_type_default = 'pgsql' -- Prefer Postgres's dialect
    end,
  },
}
