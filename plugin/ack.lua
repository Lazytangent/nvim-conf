if vim.fn.executable("ag") == 1 then
  vim.opt.grepprg = "ag --nogroup --nocolor --vimgrep --smart-case"
  vim.g.ackprg = 'ag --vimgrep --smart-case'
end
