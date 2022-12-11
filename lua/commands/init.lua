local utils = require("utils.core")

local modules = {
  "cd",
  "find",
  "gen_secret",
  "gen_uuid",
  "go_run",
  "jq",
  "nuke_plugins",
  "unset",
  "touch",
  "trim",
  "yabs",
}

utils.load_modules("commands", modules)
