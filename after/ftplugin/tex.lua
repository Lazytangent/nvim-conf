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

local mappings = {
  { '[m', desc = "[Count] Previous start of an environment begin" },
  { ']m', desc = "[Count] Next start of an environment begin" },
  { '[M', desc = "[Count] Previous end of an environment end" },
  { ']M', desc = "[Count] Next end of an environment end" },

  { ']]', desc = "[Count] Next beginning of a section" },
  { '][', desc = "[Count] Next end of a section" },
  { '[[', desc = '[Count] Previous beginning of a section' },
  { '[]', desc = '[Count] Previous end of a section' },

  { ']n', desc = '[Count] Next start of a math zone' },
  { ']N', desc = '[Count] Next end of a math zone' },
  { '[n', desc = '[Count] Previous start of a math zone' },
  { '[N', desc = '[Count] Previous end of a math zone' },

  { ']r', desc = '[Count] Next start of a frame environment' },
  { ']R', desc = '[Count] Next end of a frame environment' },
  { '[r', desc = '[Count] Previous start of a frame environment' },
  { '[R', desc = '[Count] Previous end of a frame environment' },

  { ']/', desc = '[Count] Next start of a LaTeX comment' },
  { ']*', desc = '[Count] Next end of a LaTeX comment' },
  { '[/', desc = '[Count] Previous start of a LaTeX comment' },
  { '[*', desc = '[Count] Previous end of a LaTeX comment' },
}

require('which-key').add {
  {
    mappings
  }
}
