return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      require 'extensions.dap.configs.dap'
    end,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      {
        "theHamsta/nvim-dap-virtual-text",
        config = true,
      },
    },
  },
}
