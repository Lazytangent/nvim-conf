local nmap = function(lhs, rhs)
  vim.keymap.set('n', lhs, rhs, {
    buffer = true,
  })
end

nmap('<localleader>rr', function() vim.cmd('Rest run') end)
nmap('<localleader>rL', function() vim.cmd('Rest last') end)
nmap('<localleader>rl', function() vim.cmd('Rest logs') end)
nmap('<localleader>re', require('telescope').extensions.rest.select_env)
