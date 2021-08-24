local system_output = io.popen('uname', 'r')
local system = system_output:read('*l')
system_output:close()

if system == 'Darwin' then
  local handle = io.popen([[echo "$(brew --prefix)"]])
  local result = handle:read("*l")
  handle:close()

  vim.g.gutentags_ctags_executable = tostring(result) .. "/bin/ctags"
end
