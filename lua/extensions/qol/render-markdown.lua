return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-orgmode/orgmode',
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.nvim',
  },
  opts = {
    enabled = true,
    file_types = {
      'markdown',
      'org',
    },
    -- indent = {
    --   enabled = true,
    --   render_modes = { 'n' },
    -- },
    -- headings = {
    --   enabled = true,
    -- },
    log_level = 'trace',
  },
}
