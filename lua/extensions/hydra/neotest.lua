local Hydra = require("hydra")
local utils = require('mappings.utils')

local hint = [[
_a_: Attach _d_: Debug nearest test _f_: Run file _o_: Open output _s_: Stop running test _t_: Run nearest test
_mc_: Close summary _mo_: Open summary _mm_: Toggle summary _mt_: Toggle summary

                        _n_: Next failed test _p_: Prev failed test
]]

local call_func = function(module, func, args)
  local mod = require(module)

  return function()
    mod[func](args)
  end
end

Hydra({
  hint = hint,
  mode = 'n',
  config = {
    color = 'pink',
    invoke_on_body = true,
  },
  body = '<leader>n',
  heads = {
    { 'a', utils.lua_require('neotest', 'run.attach()') },
    { 'd', utils.lua_require('neotest', "run.run({ strategy = 'dap' })") },
    { 'f', utils.lua_require('neotest', "run.run(vim.fn.expand('%'))") },
    { 'n', utils.lua_require('neotest', "jump.next({ status = 'failed' })") },
    { 'o', utils.lua_require('neotest', 'output.open({ enter = true })') },
    { 'p', utils.lua_require('neotest', "jump.prev({ status = 'failed' })") },
    { 's', utils.lua_require('neotest', 'run.stop()') },
    { 't', utils.lua_require('neotest', 'run.run()') },
    { 'mc', utils.lua_require('neotest', 'summary.close()') },
    { 'mo', utils.lua_require('neotest', 'summary.open()') },
    { 'mm', utils.lua_require('neotest', 'summary.toggle()') },
    { 'mt', utils.lua_require('neotest', 'summary.toggle()') },
  },
})
