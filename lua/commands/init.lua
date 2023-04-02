local utils = require("utils.core")

local modules = {
  "cd",
  "config",
  "gen_secret",
  "gen_uuid",
  "go_run",
  "jq",
  "messages",
  "nuke_plugins",
  "print_snippets",
  "touch",
  "trim",
  "unset",
  "yabs",
}

utils.load_modules("commands", modules)
