Opts = {
  listchars = "tab:\u{BB}\u{BB},trail:\u{B7},nbsp:~",

  shell = '/bin/zsh',
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
  spelllang = "en_us",
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
  laststatus = 3,

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

  -- guifont = "Iosevka Nerd Font Mono:h12",

  showmode = false,
  grepprg = "ag",
  shiftround = true,

  undofile = true,
  tags = "./tags;",
  -- formatlistpat = "\C^\s*[\[({]\?\([0-9]\+\|[iIvVxXlLcCdDmM]\+\|[a-zA-Z]\)[\]:.)}]\s\+\|^\s*[-+o*]\s\+",
}

Theming = {
  -- colorscheme = "moonlight",
  colorscheme = 'tokyonight',
  -- colorscheme = "catppuccin",
}

LSP = {
  enabled = true,
  virtual_text = true,
  highlight_word = true,
  servers = {
    primary = {
      "angularls",
      "bashls",
      "clangd",
      "cssls",
      "dockerls",
      "erlangls",
      "graphql",
      "html",
      "jdtls",
      "jedi_language_server",
      "prismals",
      "rls",
      "rust_analyzer",
      "solargraph",
      "sourcekit",
      "stylelint_lsp",
      "texlab",
      "tsserver",
      "vimls",
      "volar",
      "yamlls",
    },
    regular = {
      "pylsp",
      "terraformls",
      "terraform_lsp",
    },
    custom = {
      "denols",
      "elixirls",
      -- "eslint",
      "emmet_ls",
      "gopls",
      "java_language_server",
      "jsonls",
      -- "pyright",
      "sqlls",
      "sumneko_lua",
      "tailwindcss",
      "vuels",
    },
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
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "latex",
    "lua",
    "org",
    "python",
    "query",
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

Debuggers = {
  "python",
  "ccppr_vsc",
  "lua",
  "chrome",
  "jsnode",
}
