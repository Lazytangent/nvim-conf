local diagnostics = {
  document = function()
    MiniExtra.pickers.diagnostic({ scope = "current" })
  end,
  workspace = function()
    MiniExtra.pickers.diagnostic({ scope = "all" })
  end,
}

return {
  { "<leader>pd",  group = "Diagnostics" },
  { "<leader>pdd", diagnostics.document,  desc = "Document" },
  { "<leader>pdw", diagnostics.workspace, desc = "Workspace" },
}
