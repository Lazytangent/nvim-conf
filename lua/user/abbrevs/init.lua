local M = {}

local abbrevs = {
  ["representation{,s}"] = { "reprr{,s}" },
  ["of course"] = { "ofc" },
  ["for example"] = { "fex" },
  ["procedure{,s}"] = { "proc{,s}" },
  ["gRPC"] = { "grpc" },
  ["for instance"] = { "finst" },
  ["because"] = { "bce" },
}

M.apply_abbrevs = function()
  for word, list in pairs(abbrevs) do
    for _, shortcut in ipairs(list) do
      vim.cmd("Abolish " .. shortcut .. " " .. word)
    end
  end
end

return M
