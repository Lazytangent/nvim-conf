local servers = require("config").LSP.servers.custom

for _, server in ipairs(servers) do
  require("lsp.custom." .. server)
end
