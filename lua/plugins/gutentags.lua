local handle = io.popen([[echo "$(brew --prefix)"]])
local result = handle:read("*l")
handle:close()

vim.g.gutentags_ctags_executable = tostring(result) .. "/bin/ctags"
