return {
  "mattn/emmet-vim",
  init = function()
    vim.g.user_emmet_leader_key = '<C-l>'

    vim.g.user_emmet_settings = {
      javascript = {
        extends = 'jsx',
      },
    }
  end,
}
