-- Treesitter
vim.treesitter.start(0, 'latex')
vim.bo.syntax = 'on'

local abbrevs = {
  ["representation{,s}"] = { "reprr{,s}" },
  ["of course"] = { "ofc" },
  ["for example"] = { "fex" },
  ["procedure{,s}"] = { "proc{,s}" },
  ["gRPC"] = { "grpc" },
  ["for instance"] = { "finst" },
  ["because"] = { "bce" },
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

  { 'dsc', desc = 'Delete surrounding command' },
  { 'dse', desc = 'Delete surrounding environment' },
  { 'ds$', desc = 'Delete surrounding math environment' },
  { 'dsd', desc = 'Delete surrounding delimiter' },

  { 'csc', desc = 'Delete surrounding command' },
  { 'cse', desc = 'Delete surrounding environment' },
  { 'cs$', desc = 'Delete surrounding math environment' },
  { 'csd', desc = 'Delete surrounding delimiter' },

  { 'tse', desc = 'Toggle environment' },
  { 'tsc', desc = 'Toggle starred command' },
  { 'tss', desc = 'Toggle starred environment' },
  { 'ts$', desc = 'Toggle math environment' },
  { 'tsd', desc = 'Toggle delimiter' },
  { 'tsD', desc = 'Toggle delimiter' },
  { 'tsf', desc = 'Toggle inline fraction' },
  { 'tsb', desc = 'Toggle line-break' },
}

require('which-key').add {
  {
    mappings
  },
  {
    mode = { "o" },
    {
      { 'ic', desc = 'Inner Command' },
      { 'ac', desc = 'A Command' },
      { 'id', desc = 'Inner Delimiter' },
      { 'ad', desc = 'A Delimiter' },
      { 'ie', desc = 'Inner Environment' },
      { 'ae', desc = 'A Environment' },
      { 'i$', desc = 'Inner Math Environment' },
      { 'a$', desc = 'A Math Environment' },
      { 'iP', desc = 'Inner Section' },
      { 'aP', desc = 'A Section' },
      { 'im', desc = 'Inner Item' },
      { 'am', desc = 'A Item' },
    },
  },
}
