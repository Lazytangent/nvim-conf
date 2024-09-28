local generate_matrix = function(args, snip)
  local rows = tonumber(snip.captures[2])
  local cols = tonumber(snip.captures[3])
  local nodes = {}
  local ins_indx = 1
  for j = 1, rows do
    if ins_indx ~= 1 then
      table.insert(nodes, t({ "\\\\", "" }))
    end
    table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
    ins_indx = ins_indx + 1
    for k = 2, cols do
      table.insert(nodes, t(" & "))
      table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
      ins_indx = ins_indx + 1
    end
  end
  return sn(nil, nodes)
end

local function math()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local snippets = {
  s({
      trig = "([%sbBpvV])Mat(%d+)x(%d+)",
      regTrig = true,
      wordTrig = false,
      dscr = "[bBpvV]matrix of A x B size",
    },
    fmta([[
      \begin{<>}
      <>
      \end{<>}]],
      {
        f(function(_, snip)
          if snip.captures[1] == " " then
            return "matrix"
          else
            return snip.captures[1] .. "matrix"
          end
        end),
        d(1, generate_matrix),
        f(function(_, snip)
          if snip.captures[1] == " " then
            return "matrix"
          else
            return snip.captures[1] .. "matrix"
          end
        end)
      }
    ),
    { condition = math }
  )
}

return snippets
