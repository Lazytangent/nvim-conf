local u = require("utils.core")
local cmd = vim.cmd

-- Global
u.opt("o", "incsearch", true)
u.opt("o", "ignorecase", true)
u.opt("o", "wildmenu", true)
u.opt("o", "wildmode", "longest:full,list:full")
u.opt("o", "wildignore", "*.o,*~,*.pyc,*/.git*,*/.hg/*,*/.svn/*,*/.DS_Store")
u.opt("o", "showcmd", true)
u.opt("o", "cmdheight", 1)
u.opt("o", "ruler", "hidden")
u.opt("o", "backspace", "eol,start,indent")
u.opt("o", "whichwrap", "<,>,h,l")
u.opt("o", "smartcase", true)
u.opt("o", "hlsearch", true)
u.opt("o", "lazyredraw", true)
u.opt("o", "magic", true)
u.opt("o", "showmatch", true)
u.opt("o", "mat=2", true)
u.opt("o", "foldcolumn", 1)
u.opt("o", "noshowmode", true)
u.opt("o", "clipboard", "unnamed")
u.opt("o", "list", true)
u.opt("o", "mouse", "a")
u.opt("o", "spell", true)
u.opt("o", "modeline", true)
u.opt("o", "foldenable", true)
u.opt("o", "foldlevelstart", 10)

-- Window
u.opt("w", "relativenumber", Opts.relativenumber)
u.opt("w", "number", true)
u.opt("w", "numberwidth", 5)
u.opt("w", "wrap", Opts.wrap)
u.opt("w", "cursorline", Opts.cursorline)

-- Buffer
local indent = Formatting.indent_size
u.opt("b", "tabstop", 8)
u.opt("b", "softtabstop", indent)
u.opt("b", "shiftwidth", indent)
u.opt("b", "expandtab", true)
u.opt("b", "autoindent", true)
u.opt("b", "smartindent", true)
u.opt("b", "fileencoding", "utf-8")
u.opt("b", "syntax", "on")

-- Commands
cmd("set path+=.,**")
cmd("filetype plugin indent on")
cmd("exec \"set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~\"")


