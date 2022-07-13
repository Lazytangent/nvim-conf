local modules = {
  "cd",
  "find",
  "gen_secret",
  "gen_uuid",
  "touch",
  "yabs",
}

for _, module in ipairs(modules) do
  require("commands." .. module)
end
