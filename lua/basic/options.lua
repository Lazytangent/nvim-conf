vim.go.completeopt    = "menuone,noselect"
vim.go.foldlevelstart = 10
vim.go.foldopen       = ""
vim.go.grepprg        = "rg --vimgrep --smart-case --no-heading"
vim.go.hlsearch       = true
vim.go.ignorecase     = true
vim.go.incsearch      = true
vim.go.laststatus     = 3
vim.go.lazyredraw     = true
vim.go.listchars      = "tab:\u{BB}\u{BB},trail:\u{B7},nbsp:~"
vim.go.magic          = true
vim.go.matchtime      = 2
vim.go.mouse          = "a"
vim.go.ruler          = true
vim.go.shell          = "/bin/zsh"
vim.go.shiftround     = true
vim.go.showcmd        = true
vim.go.showmatch      = true
vim.go.showmode       = false
vim.go.smartcase      = true
vim.go.splitbelow     = true
vim.go.splitright     = true
vim.go.tags           = "./tags;"
vim.go.termguicolors  = true
vim.go.timeoutlen     = 500
vim.go.updatetime     = 300
vim.go.wildignore     = "*.o,*~,*.pyc,*/.git/*,*.hg/*,*/.svn/*,*/.DS_Store,*/__pycache__/*,*/target/*"
vim.go.wildmenu       = true
vim.go.wildmode       = "longest,list:full"
vim.go.writebackup    = false

vim.wo.cursorline     = true
vim.wo.foldcolumn     = "3"
vim.wo.foldexpr       = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod     = "expr"
vim.wo.list           = true
vim.wo.number         = false
vim.wo.numberwidth    = 5
vim.wo.relativenumber = false
vim.wo.spell          = true
vim.wo.wrap           = true

-- So far, only buffer-local settings were being overwritten after using Telescope.
-- It seems like the Telescope buffer applied settings that would overwrite the origin vim.bo settings.
local settings = {
  buffer = {
    autoindent   = true,
    expandtab    = true,
    fileencoding = "utf-8",
    indentexpr   = "v:lua.require'nvim-treesitter'.indentexpr()",
    modeline     = true,
    shiftwidth   = 4,
    smartindent  = false,
    softtabstop  = 4,
    -- Was originally the default, but got moved to stdpath('data')/site/
    spellfile    = vim.fn.stdpath('config') .. "/spell/en.utf-8.add",
    spelllang    = "en_us",
    swapfile     = false,
    syntax       = "off",
    tabstop      = 8,
    textwidth    = 80,
    undofile     = true,
  },
}

for k, v in pairs(settings.buffer) do
  vim.bo[k] = v
  vim.o[k] = v
end

vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.errorformat:append({ "%f" })
vim.opt.formatoptions:append({ "t" })
vim.opt.path:append({ "**" })
vim.opt.whichwrap:append({ ["<"] = true, [">"] = true, h = true, l = true })

vim.opt.diffopt = {
  "internal",
  "filler",
  "closeoff",
  "context:12",
  "algorithm:histogram",
  "linematch:200",
  "indent-heuristic",
  "iwhite",
}

vim.cmd "filetype plugin indent on"
vim.cmd "syntax keyword dbmlType string varbinary"

local python3_host_prog = "$HOME/.local/src/neovim-plugins/python-support/.venv/bin/python"
-- vim.cmd("let g:python3_host_prog = '" .. python3_host_prog .. "'")
vim.g.python3_host_prog = python3_host_prog

-- Diagnostics
vim.diagnostic.config({
  virtual_text = {
    current_line = true,
  },
})

-- Disable LSP logging
vim.lsp.log.set_level(vim.log.levels.OFF)
