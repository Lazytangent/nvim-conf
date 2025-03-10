local abbrevs = {
  ["representation{,s}"] = { "reprr{,s}" },
  ["of course"] = { "ofc" },
  ["for example"] = { "fex" },
  ["procedure{,s}"] = { "proc{,s}" },
  ["grpc"] = { "gRPC" },
}

for word, list in pairs(abbrevs) do
  for _, shortcut in ipairs(list) do
    vim.cmd("Abolish " .. shortcut .. " " .. word)
  end
end
