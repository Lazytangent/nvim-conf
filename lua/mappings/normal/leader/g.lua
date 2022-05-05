local g = {
  name = "+Git",
  c = { [[<cmd>Git commit<cr>]], "commit" },
  f = { [[<cmd>Git fetch<cr>]], "fetch" },
  g = { [[<cmd>Git<cr>]], "status" },
  l = { [[<cmd>Git pull<cr>]], "pull" },
  L = { [[<cmd>Git log<cr>]], "log" },
  p = { [[<cmd>Git push<cr>]], "push" },
  P = {
    name = "+Push",
    m = { [[<cmd>Git push -u origin main<cr>]], "main" },
    p = { [[:Git push -u origin<space>]], "branch" },
  },
  s = { [[<cmd>Git<cr>]], "status" },
  w = { [[<cmd>Gw<cr>]], "write" },
  S = { [[<cmd>Git stash<cr>]], "stash file" },
}

return g
