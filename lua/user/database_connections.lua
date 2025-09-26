local utils = require("user.database.utils")

local function configure_databases_from_env()
  local dbs = utils.parse_databases_from_env()

  vim.g.dbs = dbs
end

configure_databases_from_env()
