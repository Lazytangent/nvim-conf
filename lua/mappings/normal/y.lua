---@param command string
local function cmd(command)
  vim.cmd(command)
end

return {
  {
    "yp", -- Yank absolute Path of current buffer
    function()
      -- :help expand()
      local path = vim.fn.expand("%:p")
      -- :help setreg
      vim.fn.setreg("+", path)
    end,
    desc = "Yank absolute path of current buffer",
  },

  { "yo",  group = "option" },
  { "yon", cmd "set number!", desc = "number" },
  { "yor", cmd "set relativenumber!", desc = "relativenumber" },
  { "yos", cmd "set spell!", desc = "spell" },
  { "yow", cmd "set wrap!", desc = "wrap" },
  { "yox", desc = "crosshairs" },

  { "yom", "<cmd>set modifiable<cr>", desc = "Set modifiable" },
  {
    "yoz",
    function()
      if vim.g.syntax_on == 1 then
        vim.cmd "syntax off"
      else
        vim.cmd "syntax enable"
      end
    end,
    desc = "Toggle syntax"
  },
}
