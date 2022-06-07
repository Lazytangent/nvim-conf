vim.api.nvim_create_user_command("Yabs", function(opts)
  require('yabs'):run_task(opts.args)
end, {
  nargs = "*",
  complete = function(_, line)
    local tasks = require('extensions.yabs.tasks')

    local l = vim.split(line, "%s+")
    local n = #l - 2

    if n == 0 then
      return vim.tbl_filter(function(val)
        return vim.startswith(val, l[2])
      end, tasks)
    end
  end,
})
