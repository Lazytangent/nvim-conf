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
  { "yob", desc = "background" },
  { "yoc", desc = "cursorline" },
  { "yod", desc = "diff" },
  { "yoh", desc = "hlsearch" },
  { "yoi", desc = "ignorecase" },
  { "yol", desc = "list" },
  { "yon", desc = "number" },
  { "yor", desc = "relativenumber" },
  { "yos", desc = "spell" },
  { "you", desc = "cursorcolumn" },
  { "yov", desc = "virtualedit" },
  { "yow", desc = "wrap" },
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
