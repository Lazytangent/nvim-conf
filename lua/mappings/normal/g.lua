local dial_map = require 'dial.map'

return {
  {
    "g<C-a>",
    function()
      dial_map.manipulate("increment", "gnormal")
    end,
    desc = "gnormal increment",
  },
  {
    "g<C-x>",
    function()
      dial_map.manipulate("decrement", "gnormal")
    end,
    desc = "gnormal decrement",
  },
}
