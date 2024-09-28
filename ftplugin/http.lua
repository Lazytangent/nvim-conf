local nmap = function(lhs, rhs)
  vim.keymap.set('n', lhs, rhs, {
    buffer = true,
  })
end

nmap('<localleader>.', function() vim.cmd('Rest run') end)
nmap('<localleader>mr', function() vim.cmd('Rest run') end)
nmap('<localleader>mL', function() vim.cmd('Rest last') end)
nmap('<localleader>ml', function() vim.cmd('Rest logs') end)
nmap('<localleader>me', require('telescope').extensions.rest.select_env)
