return {
  'simifalaye/minibuffer.nvim',
  init = function()
    local minibuffer = require("minibuffer")

    vim.ui.select = require("minibuffer.builtin.ui_select")
    vim.ui.input = require("minibuffer.builtin.ui_input")

    vim.keymap.set("n", "<leader>;", require("minibuffer.builtin.cmdline"))
    vim.keymap.set("n", "<leader>.", function()
      minibuffer.resume(true)
    end)

    local wk_mb = require("minibuffer.integrations.which-key")
    local wk_view = require('which-key.view')
    wk_view.show = wk_mb.show
    wk_view.hide = wk_mb.hide
  end,
  dependencies = {
    "folke/which-key.nvim",
  },
}
