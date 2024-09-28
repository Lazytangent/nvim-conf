local nmap = function(lhs, rhs)
  vim.keymap.set('n', lhs, rhs, {
    buffer = true,
  })
end

nmap('<localleader>Rr', function() vim.cmd('Rest run') end)
nmap('<localleader>RL', function() vim.cmd('Rest last') end)
nmap('<localleader>Rl', function() vim.cmd('Rest logs') end)
nmap('<localleader>Re', require('telescope').extensions.rest.select_env)
