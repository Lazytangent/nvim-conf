local servers = require("config").LSP.servers.custom
local utils = require("utils.core")

utils.load_modules("lsp.custom", servers)
