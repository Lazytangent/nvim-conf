if vim.fn.has('nvim') == 1 and vim.fn.executable('nvr') == 1 then
  vim.cmd([[let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"]])
end
