return {
  { "<leader>x",  group = "Trouble" },
  { "<leader>xl", function() vim.cmd "Trouble loclist" end,        desc = "toggle location list" },
  { "<leader>xq", function() vim.cmd "Trouble quickfix" end,       desc = "toggle quickfix" },
  { "<leader>xr", function() vim.cmd "Trouble lsp_references" end, desc = "toggle lsp references" },
  { "<leader>xx", function() vim.cmd "Trouble diagnostics" end,    desc = "toggle" },
}
