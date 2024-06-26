local config = {}

config.Opts = {
  autoindent        = true,
  background        = "dark",
  backspace         = "eol,start,indent",
  backup            = false,
  cmdheight         = 1,
  cursorline        = true,
  expandtab         = true,
  fileencoding      = "utf-8",
  foldcolumn        = "2",
  foldenable        = true,
  foldexpr          = "nvim_treesitter#foldexpr()",
  foldlevelstart    = 10,
  foldmethod        = "expr",
  grepprg           = "rg --vimgrep --smart-case --no-heading",
  -- guifont           = "Fira_Code_Regular_Nerd_Font_Complete:h12", -- This setting works for VimR
  hlsearch          = true,
  ignorecase        = true,
  incsearch         = true,
  indent_size       = 4,
  laststatus        = 3,
  lazyredraw        = true,
  list              = true,
  listchars         = "tab:\u{BB}\u{BB},trail:\u{B7},nbsp:~",
  magic             = true,
  matchtime         = 2,
  modeline          = true,
  mouse             = "a",
  number            = false,
  numberwidth       = 5,
  python3_host_prog = "$HOME/.local/src/neovim-plugins/python-support/.venv/bin/python",
  relativenumber    = false,
  ruler             = true,
  scrolloff         = 7,
  shell             = '/bin/zsh',
  shiftround        = true,
  showcmd           = true,
  showmatch         = true,
  showmode          = false,
  smartcase         = true,
  smartindent       = false,
  smarttab          = true,
  spell             = true,
  spelllang         = "en_us",
  splitbelow        = true,
  splitright        = true,
  swapfile          = false,
  syntax            = "off",
  tags              = "./tags;",
  termguicolors     = true,
  textwidth         = 80,
  timeoutlen        = 500,
  undofile          = true,
  updatetime        = 300,
  wildignore        = "*.o,*~,*.pyc,*/.git/*,*.hg/*,*/.svn/*,*/.DS_Store,*/__pycache__/*,*/target/*",
  wildmenu          = true,
  wildmode          = "longest,list:full",
  wrap              = true,
  writebackup       = false,
}

config.Theming = {
  colorscheme = "catppuccin",
}

config.LSP = {
  enabled        = true,
  highlight_word = true,
  virtual_text   = true,
  servers = {
    primary = {
      "angularls",
      "bashls",
      "cmake",
      "cssls",
      "cucumber_language_server",
      "dockerls",
      "graphql",
      "helm_ls",
      "hls",
      "html",
      "jedi_language_server",
      "kotlin_language_server",
      "prismals",
      "solargraph",
      "stylelint_lsp",
      "texlab",
      "vimls",
      "volar",
      "zls",
    },
    regular = {
      "basedpyright",
      "pylsp",
      "terraformls",
      "terraform_lsp",
    },
    custom = {
      "beancount",
      "ccls",
      "clangd",
      "deno",
      "go",
      "jsonls",
      "lua",
      "ruff_lsp",
      "sourcekit",
      "sql",
      "vue",
      "yaml",
    },
  },
}

config.Completion = {
  enabled = true,
  autopairs = true,
  items = 10,
  completeopt = "menuone,noselect",
}

config.Treesitter = {
  enabled = true,
  disabled = { 'latex', 'tex' },
  parsers = {
    "bash",
    "beancount",
    "c",
    "cpp",
    "css",
    "dart",
    "dockerfile",
    "elixir",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "graphql",
    "html",
    "http",
    "java",
    "javascript",
    "jq",
    "jsdoc",
    "json",
    "kotlin",
    "latex",
    "lua",
    "make",
    "org",
    "python",
    "query",
    "regex",
    "ruby",
    "rust",
    "scheme",
    "scss",
    "sql",
    "swift",
    "toml",
    "typescript",
    "tsx",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
    "zig",
  }
}

return config
