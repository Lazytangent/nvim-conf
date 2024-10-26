local dial_map = require 'dial.map'

return {
  {
    "<C-a>",
    function()
      dial_map.manipulate("increment", "normal")
    end,
    desc = "Increment with dial"
  },
  { "<C-h>",  desc = "Signature help" }, -- Set via LSP on_attach
  {
    "<C-w>d",
    function()
      vim.cmd "vsplit"
      vim.lsp.buf.definition()
    end,
    desc = "Vertical split and Go to definition"
  },
  {
    "<C-x>",
    function()
      dial_map.manipulate("decrement", "normal")
    end,
    desc = "Decrement with dial"
  },

}
