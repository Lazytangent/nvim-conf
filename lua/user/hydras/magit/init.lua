local Hydra = require('hydra')

local parent = (...):match("(.-)[^%.]+$")
local current = parent .. 'magit.'

local gitignore = require(current .. 'ignore')

Hydra({
  hint = [[
  ^
  _A_ Apply         _i_ Ignore         r Rebase
  _b_ Branch        ^I Init           ^t Tag
  _B_ Bisect        ^j Display status ^T Note
  _c_ Commit        ^J Display buffer ^V Revert
  _C_ Clone         ^l Log            ^w Apply patches
  _d_ Diff          ^L Log (change)   ^W Format patches
  _D_ Diff (change) ^m Merge          ^X Reset
  _e_ Ediff (dwim)  ^M Remote         ^y Show refs
  _E_ Ediff         ^N Forge          ^Y Cherries
  _f_ Fetch         ^o Submodule      ^z Stash
  _F_ Pull          ^O Subtree        ^Z Worktree
  _h_ Help          ^P Push           ^! Run
  _H_ Section info  ^Q Command
  ^
  ]],
  config = {
    invoke_on_body = true,
    hint = {
      position = "bottom-left",
    },
  },
  body = "<leader>gx",
  heads = {
    {
      'A',
      function () vim.notify("Apply") end,
      { exit = true },
    },
    {
      'b',
      function () vim.notify("Branch") end,
      { exit = true },
    },
    {
      'B',
      function () vim.notify("Bisect") end,
      { exit = true },
    },
    {
      'c',
      function () vim.notify("Commit") end,
      { exit = true },
    },
    {
      'C',
      function () vim.notify("Clone") end,
      { exit = true },
    },
    {
      'd',
      function () vim.notify("Diff") end,
      { exit = true },
    },
    {
      'D',
      function () vim.notify("Diff (change)") end,
      { exit = true },
    },
    {
      'e',
      function () vim.notify("Ediff (dwim)") end,
      { exit = true },
    },
    {
      'E',
      function () vim.notify("Ediff") end,
      { exit = true },
    },
    {
      'f',
      function () vim.notify("Fetch") end,
      { exit = true },
    },
    {
      'F',
      function () vim.notify("Pull") end,
      { exit = true },
    },
    {
      'h',
      function () vim.notify("Help") end,
      { exit = true },
    },
    {
      'H',
      function () vim.notify("Section info") end,
      { exit = true },
    },
    {
      'i',
      function()
        Hydra.activate(gitignore)
      end,
      {
        exit = true,
        nowait = true,
      },
    },
  },
})
