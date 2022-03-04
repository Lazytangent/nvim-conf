local cmd = vim.cmd

C = Theming.colorscheme
vim.g.tokyonight_style = "night"
-- vim.g.material_style = "deep ocean"

-- Configure theme from global
cmd("colorscheme " .. C)

-- Configure theme with Plugin
-- require('github-theme').setup {}
