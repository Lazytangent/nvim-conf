local nmap = function(lhs, rhs)
  vim.keymap.set('n', lhs, rhs, {
    buffer = true,
  })
end

nmap('<localleader>.',  function() require('kulala').run() end)
nmap('<localleader>mr', function() require('kulala').run() end)
nmap('<localleader>mL', function() require('kulala').replay() end)
nmap('<localleader>ml', function() require('kualala').inspect() end)
nmap('<localleader>me', function() require('kulala').set_selected_env() end)
nmap('<localleader>t', function() require('kulala').toggle_view() end)
nmap('<localleader>S', function() require('kulala').show_stats() end)
nmap('<localleader>cc', function() require('kulala').copy() end)
nmap('<localleader>cp', function() require('kulala').from_curl() end)
nmap('<localleader>f', function() require('kulala').search() end)
nmap('<localleader>n', function() require('kulala').jump_next() end)
nmap('<localleader>p', function() require('kulala').jump_prev() end)
nmap('<localleader>]', function() require('kulala').jump_next() end)
nmap('<localleader>[', function() require('kulala').jump_prev() end)
nmap('<localleader>u', function() require('lua.kulala.ui.auth_manager').open_auth_config() end)
nmap('<localleader>g', function() require('kulala').download_graphql_schema() end)
