local cmd = vim.cmd

C = Theming.colorscheme

-- Configure theme from global
cmd("colorscheme " .. C)

-- Configure theme with Plugin
-- require('github-theme').setup {}
