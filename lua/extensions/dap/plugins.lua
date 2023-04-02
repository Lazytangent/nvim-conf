return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require 'extensions.dap'
    end,
  },
  "mfussenegger/nvim-dap-python",
  "theHamsta/nvim-dap-virtual-text",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = true,
  },
}
