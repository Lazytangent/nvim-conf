local abbrevs = {
  the = { "hte", "teh" },
  to = { "ot" },
  ["and"] = { "nad" },
  why = { "hwy" },
}

for word, list in pairs(abbrevs) do
  for _, shortcut in ipairs(list) do
    vim.cmd("iabbrev " .. shortcut .. " " .. word)
  end
end
