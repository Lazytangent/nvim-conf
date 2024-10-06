vim.go.completeopt    = "menuone,noselect"
vim.go.foldlevelstart = 10
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
vim.go.scrolloff      = 2
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
vim.wo.foldexpr       = "nvim_treesitter#foldexpr()"
vim.wo.foldmethod     = "expr"
vim.wo.list           = true
vim.wo.number         = false
vim.wo.numberwidth    = 5
vim.wo.relativenumber = false
vim.wo.spell          = true
vim.wo.wrap           = true

vim.bo.autoindent   = true
vim.bo.expandtab    = true
vim.bo.fileencoding = "utf-8"
vim.bo.modeline       = true
vim.bo.shiftwidth   = 4
vim.bo.smartindent  = false
vim.bo.softtabstop  = 4
vim.bo.spelllang      = "en_us"
vim.bo.swapfile     = false
vim.bo.syntax       = "off"
vim.bo.tabstop      = 8
vim.bo.textwidth    = 80
vim.bo.undofile       = true

vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.errorformat:append({ "%f" })
vim.opt.formatoptions:append({ "t" })
vim.opt.path:append({ "**" })
vim.opt.whichwrap:append({ ["<"] = true, [">"] = true, h = true, l = true })

vim.cmd "filetype plugin indent on"
vim.cmd "syntax keyword dbmlType string varbinary"

local python3_host_prog = "$HOME/.local/src/neovim-plugins/python-support/.venv/bin/python"
vim.cmd("let g:python3_host_prog = '" .. python3_host_prog .. "'")
