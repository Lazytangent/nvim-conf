local utils = require("utils.core")

local modules = {
  "cd",
  "columns",
  "config",
  "edit_snippet",
  "format",
  "gen_secret",
  "gen_uuid",
  "go_run",
  "jq",
  "messages",
  "new",
  "nuke_plugins",
  "org",
  "print_snippets",
  "touch",
  "trim",
  "unset",
}

utils.load_modules("commands", modules)
