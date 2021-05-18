Opts = {
  listchars = true,

  splitbelow = true,
  splitright = true,
  incsearch = true,
  ignorecase = true,
  wildmenu = true,
  wildmode = "longest:full,list:full",
  wildignore = "*.o,*~,*.pyc,*/.git*,*.hg/*,*/.svn/*,*/.DS_Store",
  showcmd = true,
  cmdheight = 1,
  ruler = true,
  backspace = "eol,start,indent",
  whichwrap = "<,>,h,l",
  smartcase = true,
  hlsearch = true,
  lazyredraw = true,
  magic = true,
  showmatch = true,
  mat = 2,
  foldcolumn = "1",
  list = true,
  spell = true,
  modeline = true,
  foldenable = true,
  foldlevelstart = 10,
  backup = false,
  writebackup = false,
  termguicolors = true,
  background = "dark",
  timeoutlen = 500,
  updatetime = 300,
  scrolloff = 7,
  textwidth = 80,
  mouse = "a",
  smarttab = true,

  relativenumber = true,
  number = true,
  numberwidth = 5,
  wrap = true,
  cursorline = true,

  indent_size = 2,
  expandtab = true,
  autoindent = true,
  smartindent = false,
  fileencoding = "utf-8",
  syntax = "on",
  swapfile = false,
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

Treesitter = {
  enabled = true,
  rainbow = true,
  parsers = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "graphql",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "latex",
    "lua",
    "python",
    "regex",
    "toml",
    "typescript",
    "tsx",
    "yaml",
  }
}
