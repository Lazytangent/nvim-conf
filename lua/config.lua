Opts = {
  listchars = "tab:\u{BB}\u{BB},trail:\u{B7},nbsp:~",

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
  smartcase = true,
  hlsearch = true,
  lazyredraw = true,
  magic = true,
  showmatch = true,
  matchtime = 2,
  foldcolumn = "1",
  list = true,
  spell = false,
  modeline = true,
  foldenable = true,
  foldlevelstart = 10,
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
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

  guifont = "Iosevka Nerd Font Mono:h12",

  showmode = false,
  grepprg = "ag",
  shiftround = true,

  undofile = true,
  tags = "./tags;",
  gutentags_ctags_executable = "/opt/homebrew/bin/ctags",
  -- formatlistpat = "\C^\s*[\[({]\?\([0-9]\+\|[iIvVxXlLcCdDmM]\+\|[a-zA-Z]\)[\]:.)}]\s\+\|^\s*[-+o*]\s\+",
}

Theming = {
  -- colorscheme = "moonlight",
  -- colorscheme = 'tokyonight',
  colorscheme = "catppuccino",
}

LSP = {
  enabled = true,
  virtual_text = true,
  highlight_word = true,
  servers = {
    "angularls",
    "bashls",
    "clangd",
    "cssls",
    "dockerls",
    "denols",
    "elixirls",
    "emmet_ls",
    "erlangls",
    "gopls",
    "graphql",
    "groovyls",
    "html",
    "java_language_server",
    "jedi_language_server",
    "jsonls",
    "rust_analyzer",
    "solargraph",
    "sqlls",
    "texlab",
    "tsserver",
    "vimls",
    "yamlls",
  },
}

Completion = {
  enabled = true,
  autopairs = true,
  items = 10,
  completeopt = "menuone,noselect",
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
    "elixir",
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
    "ruby",
    "rust",
    "toml",
    "typescript",
    "tsx",
    "vim",
    "vue",
    "yaml",
  }
}
