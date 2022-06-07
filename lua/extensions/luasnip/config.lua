local ls = require("luasnip")

ls.config.setup({
  history = true,
  updateevents = "TextChangedI",
  store_selection_keys = "<Tab>",
})
