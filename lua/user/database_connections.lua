local default_opts = {
  username = os.getenv("USER") .. vim.uri_encode("@pager.com", "rfc2396"),
  host = "localhost",
  port = 6000,
}

local function form_base_url(opts)
  local o = opts or {}
  local username = o.username or default_opts.username
  local host = o.host or default_opts.host
  local port = o.port or default_opts.port

  return "postgresql://" .. username .. "@" .. host .. ":" .. port .. "/"
end

local function parse_databases_from_env()
  local env_var = os.getenv("NVIM_USER_DATABASES")
  if env_var == nil then
    return {}
  end

  local port = os.getenv("DATABASE_PORT")
  local base_url = form_base_url({ port = port })

  local dbs = {}
  for db in env_var:gmatch("[^\"%s]+") do
    local match = db:find(":")
    if match ~= nil then
      local name = db:sub(0, match - 1)
      local custom_port = db:sub(match + 1)
      -- find a second colon?
      local second = custom_port:find(":")
      if second ~= nil then
        -- two colons (name:prefix:port)
        local prefix = custom_port:sub(0, second - 1)
        local actual_port = custom_port:sub(second + 1)
        local url = form_base_url({ port = actual_port })
        local full_url = url .. name

        table.insert(dbs, { name = prefix .. ":" .. name, url = full_url })
      else
        -- one colon separating name and port (name:port)
        local url = form_base_url({ port = custom_port })
        local full_url = url .. name
        table.insert(dbs, { name = name, url = full_url })
      end
    else
      table.insert(dbs, { name = db, url = base_url .. db })
    end
  end
  return dbs
end

local function configure_databases_from_env()
  local dbs = parse_databases_from_env()

  vim.g.dbs = dbs
end

configure_databases_from_env()
