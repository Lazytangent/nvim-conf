local utils = require("utils.core")

local modules = {
  "cd",
  "config",
  "find",
  "gen_secret",
  "gen_uuid",
  "go_run",
  "jq",
  "nuke_plugins",
  "print_snippets",
  "unset",
  "touch",
  "trim",
  "yabs",
}

utils.load_modules("commands", modules)
