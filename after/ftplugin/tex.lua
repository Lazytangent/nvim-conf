local abbrevs = {
  ["representation{,s}"] = { "reprr{,s}" },
  ["of course"] = { "ofc" },
  ["for example"] = { "fex" },
  ["procedure{,s}"] = { "proc{,s}" },
  ["gRPC"] = { "grpc" },
}

for word, list in pairs(abbrevs) do
  for _, shortcut in ipairs(list) do
    vim.cmd("Abolish " .. shortcut .. " " .. word)
  end
end

require('nvim-surround').buffer_setup {
  surrounds = {
    ["c"] = {
      add = function()
        local cmd = require('nvim-surround.config').get_input "Command: "
        return {
          { "\\" .. cmd .. "{" },
          { "}" },
        }
      end,
    },
    ["e"] = {
      add = function()
        local env = require('nvim-surround.config').get_input "Environment: "
        return {
          { "\\begin{" .. env .. "}" },
          { "\\end{" .. env .. "}" },
        }
      end,
    },
  },
}
