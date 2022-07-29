local config = require("config")
local u = require("utils.core")
local cmd = vim.cmd
local Opts = config.Opts
local Completion = config.Completion

-- Global
u.opt("g", "splitbelow",     Opts.splitbelow)
u.opt("g", "splitright",     Opts.splitright)
u.opt("g", "incsearch",      Opts.incsearch)
u.opt("g", "ignorecase",     Opts.ignorecase)
u.opt("g", "wildmenu",       Opts.wildmenu)
u.opt("g", "wildmode",       Opts.wildmode)
u.opt("g", "wildignore",     Opts.wildignore)
u.opt("g", "showcmd",        Opts.showcmd)
u.opt("g", "cmdheight",      Opts.cmdheight)
u.opt("g", "ruler",          Opts.ruler)
u.opt("g", "backspace",      Opts.backspace)
u.opt("g", "smartcase",      Opts.smartcase)
u.opt("g", "hlsearch",       Opts.hlsearch)
u.opt("g", "lazyredraw",     Opts.lazyredraw)
u.opt("g", "magic",          Opts.magic)
u.opt("g", "showmatch",      Opts.showmatch)
u.opt("g", "matchtime",      Opts.matchtime)
u.opt("g", "foldcolumn",     Opts.foldcolumn)
u.opt("g", "list",           Opts.list)
u.opt("g", "spell",          Opts.spell)
u.opt("g", "spelllang",      Opts.spelllang)
u.opt("g", "modeline",       Opts.modeline)
u.opt("g", "foldenable",     Opts.foldenable)
u.opt("g", "foldlevelstart", Opts.foldlevelstart)
u.opt("g", "backup",         Opts.backup)
u.opt("g", "writebackup",    Opts.writebackup)
u.opt("g", "termguicolors",  Opts.termguicolors)
u.opt("g", "background",     Opts.background)
u.opt("g", "timeoutlen",     Opts.timeoutlen)
u.opt("g", "updatetime",     Opts.updatetime)
u.opt("g", "scrolloff",      Opts.scrolloff)
u.opt("g", "textwidth",      Opts.textwidth)
u.opt("g", "mouse",          Opts.mouse)
u.opt("g", "smarttab",       Opts.smarttab)
u.opt("g", "foldmethod",     Opts.foldmethod)
u.opt("g", "foldexpr",       Opts.foldexpr)
u.opt("g", "tags",           Opts.tags)
u.opt("o", "completeopt",    Completion.completeopt)
u.opt("o", "shell",          Opts.shell)
u.opt("o", "laststatus",     Opts.laststatus)
u.opt("o", "winbar",         Opts.winbar)

-- Window
u.opt("w", "relativenumber", Opts.relativenumber)
u.opt("w", "number",         Opts.number)
u.opt("w", "numberwidth",    Opts.numberwidth)
u.opt("w", "wrap",           Opts.wrap)
u.opt("w", "cursorline",     Opts.cursorline)

-- Buffer
u.opt("b", "tabstop",          8) -- Don't change this
u.opt("b", "softtabstop",      Opts.indent_size)
u.opt("b", "shiftwidth",       Opts.indent_size)
u.opt("b", "expandtab",        Opts.expandtab)
u.opt("b", "autoindent",       Opts.autoindent)
u.opt("b", "smartindent",      Opts.smartindent)
u.opt("b", "fileencoding",     Opts.fileencoding)
u.opt("b", "syntax",           Opts.syntax)
u.opt("b", "swapfile",         Opts.swapfile)
-- u.opt("b", "formatlistpat", Opts.formatlistpat)

u.opt("g", "guifont",    Opts.guifont)
u.opt("g", "grepprg",    Opts.grepprg)
u.opt("g", "shiftround", Opts.shiftround)
-- u.opt("g", "undodir", Opts.undodir)
u.opt("g", "undofile",   Opts.undofile)

-- Commands
vim.o.listchars = Opts.listchars
vim.o.showmode = Opts.showmode
vim.opt.path:append({ "**" })
vim.opt.formatoptions:append({ "t" })
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.whichwrap:append({ ["<"] = true, [">"] = true, h = true, l = true })
cmd("filetype plugin indent on")
cmd("syntax keyword dbmlType string varbinary")
cmd("set errorformat+=%f")
