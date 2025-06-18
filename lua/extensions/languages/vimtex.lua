return {
  "lervag/vimtex",
  ft = "tex",
  config = function()
    -- vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_activate = 1
    vim.g.vimtex_quickfix_mode = 0
    -- vim.g.tex_conceal = 'abdmg'
    vim.g.vimtex_compiler_latexmk = {
      ['build_dir'] = '',
      ['callback'] = 1,
      ['continuous'] = 1,
      ['executable'] = 'latexmk',
      ['hooks'] = {},
      ['options'] = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-shell-escape',
      },
    }
  end,
  cmd = {
    "Vimtex",
  },
}
