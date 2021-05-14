Opts = {
  preserve_cursor = true,
  highlight_yank = true,
  relativenumber = true,
  cursorline = true,
  listchars = true,
  wrap = true,
  timeoutlen = 500,
  updatetime = 300,
  scrolloff = 7,
}

Theming = {
  colorscheme = "moonlight",
}

LSP = {
  enabled = true,
  virtual_text = true,
  highlight_word = true,
}

Completion = {
  enabled = true,
  autopairs = true,
  items = 10,
}

Formatting = {
  trim_trailing_space = true,
  indent_size = 2,
}

Treesitter = {
  enabled = true,
  rainbow = true,
  parsers = {
    "javascript",
    "typescript",
    "tsx",
    "jsx",
    "html",
    "css",
    "c",
    "lua",
    "bash",
    "python",
    "json",
    "yaml",
  }
}
