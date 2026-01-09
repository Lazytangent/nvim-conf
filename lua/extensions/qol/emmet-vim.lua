return {
  "mattn/emmet-vim",
  init = function()
    vim.g.user_emmet_leader_key = '<C-l>'

    vim.g.user_emmet_settings = {
      javascript = {
        extends = 'jsx',
      },
      typescript = {
        extends = 'tsx',
      },
      typescriptreact = {
        extends = 'javascript',
      },
    }
  end,
}
