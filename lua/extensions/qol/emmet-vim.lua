return {
  "mattn/emmet-vim",
  commit = "3fb2f63799e1922f7647ed9ff3b32154031a76ee",
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
