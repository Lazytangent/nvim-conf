local augend = require("dial.augend")
local config = require("dial.config")
local map = require("dial.map")

config.augends:register_group {
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
    augend.date.alias["%Y-%m-%d"],
    augend.date.alias["%m/%d"],
    augend.date.alias["%H:%M"],
    augend.constant.alias.bool,
    augend.semver.alias.semver,
  },
}
