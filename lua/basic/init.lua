local modules = {
  "autocmds",
  "colorscheme",
  "mappings",
  "options",
}

for _, module in ipairs(modules) do
  require("basic." .. module)
end
