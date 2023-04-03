return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require 'extensions.dap.configs.dap'
    end,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      {
        "theHamsta/nvim-dap-virtual-text",
        config = true,
      },
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = true,
      },
    },
  },
}
