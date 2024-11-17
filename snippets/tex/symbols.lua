-- Auto symbol
local symbol_snippet = function(context, command, opts)
  opts = opts or {}
  if not context.trig then
    error("context doesn't include a `trig` key which is mandatory", 2)
  end
  context.dscr = context.dscr or command
  context.name = context.name or command:gsub([[\]], "")
  context.docstring = context.docstring or (command .. [[{0}]])
  context.wordTrig = context.wordTrig or false
  local j, _ = string.find(command, context.trig)
  if j == 2 then -- command always starts with backslash
    context.trigEngine = "ecma"
    context.trig = "(?<!\\\\)" .. "(" .. context.trig .. ")"
    context.hidden = true
  end
  return autosnippet(context, t(command), opts)
end

local symbol_specs = {
  -- operators
  ["!="] = { context = { name = "!=" }, command = [[\neq]] },
  ["<="] = { context = { name = "≤" }, command = [[\leq]] },
  [">="] = { context = { name = "≥" }, command = [[\geq]] },
  ["<<"] = { context = { name = "<<" }, command = [[\ll]] },
  [">>"] = { context = { name = ">>" }, command = [[\gg]] },
  ["~~"] = { context = { name = "~" }, command = [[\sim]] },
  ["~="] = { context = { name = "≈" }, command = [[\approx]] },
  ["~-"] = { context = { name = "≃" }, command = [[\simeq]] },
  ["-~"] = { context = { name = "⋍" }, command = [[\backsimeq]] },
  ["-="] = { context = { name = "≡" }, command = [[\equiv]] },
  ["=~"] = { context = { name = "≅" }, command = [[\cong]] },
  [":="] = { context = { name = "≔" }, command = [[\coloneq]] }, -- see mathtools package
  ["::="] = { context = { name = "double colon equals" }, command = [[\Coloneq]] },
  ["**"] = { context = { name = "·", priority = 100 }, command = [[\cdot]] },
  xx = { context = { name = "×" }, command = [[\times]] },
  ["!+"] = { context = { name = "⊕" }, command = [[\oplus]] },
  ["!*"] = { context = { name = "⊗" }, command = [[\otimes]] },

  -- sets
  NN = { context = { name = "ℕ" }, command = [[\mathbb{N}]] },
  ZZ = { context = { name = "ℤ" }, command = [[\mathbb{Z}]] },
  QQ = { context = { name = "ℚ" }, command = [[\mathbb{Q}]] },
  RR = { context = { name = "ℝ" }, command = [[\mathbb{R}]] },
  CC = { context = { name = "ℂ" }, command = [[\mathbb{C}]] },
  OO = { context = { name = "∅" }, command = [[\emptyset]] },
  -- pwr = { context = { name = "P" }, command = [[\powerset]] },
  -- cc = { context = { name = "⊂" }, command = [[\subset]] },
  -- cq = { context = { name = "⊆" }, command = [[\subseteq]] },
  -- qq = { context = { name = "⊃" }, command = [[\supset]] },
  -- qc = { context = { name = "⊇" }, command = [[\supseteq]] },
  -- ["\\\\\\"] = { context = { name = "⧵" }, command = [[\setminus]] },
  -- Nn = { context = { name = "∩" }, command = [[\cap]] },
  -- UU = { context = { name = "∪" }, command = [[\cup]] },
  -- ["::"] = { context = { name = ":" }, command = [[\colon]] },
  -- quantifiers and logic stuffs
  -- AA = { context = { name = "∀" }, command = [[\forall]] },
  -- EE = { context = { name = "∃" }, command = [[\exists]] },
  -- inn = { context = { name = "∈" }, command = [[\in]] },
  -- notin = { context = { name = "∉" }, command = [[\not\in]] },
  ["!-"] = { context = { name = "¬" }, command = [[\lnot]] },
  VV = { context = { name = "∨" }, command = [[\lor]] },
  WW = { context = { name = "∧" }, command = [[\land]] },
  ["!W"] = { context = { name = "∧" }, command = [[\bigwedge]] },
  ["=>"] = { context = { name = "⇒" }, command = [[\implies]] },
  ["=<"] = { context = { name = "⇐" }, command = [[\impliedby]] },
  iff = { context = { name = "⟺" }, command = [[\iff]] },
  ["->"] = { context = { name = "→", priority = 250 }, command = [[\to]] },
  ["!>"] = { context = { name = "↦" }, command = [[\mapsto]] },
  ["<-"] = { context = { name = "↦", priority = 250}, command = [[\gets]] },

  -- differentials
  dp = { context = { name = "⇐" }, command = [[\partial]] },

  -- arrows
  ["-->"] = { context = { name = "⟶", priority = 500 }, command = [[\longrightarrow]] },
  ["<->"] = { context = { name = "↔", priority = 500 }, command = [[\leftrightarrow]] },
  ["2>"] = { context = { name = "⇉", priority = 400 }, command = [[\rightrightarrows]] },
  upar = { context = { name = "↑" }, command = [[\uparrow]] },
  dnar = { context = { name = "↓" }, command = [[\downarrow]] },

  -- etc
  -- ooo = { context = { name = "∞" }, command = [[\infty]] },
  -- lll = { context = { name = "ℓ" }, command = [[\ell]] },
  -- dag = { context = { name = "†" }, command = [[\dagger]] },
  -- ["+-"] = { context = { name = "†" }, command = [[\pm]] },
  -- ["-+"] = { context = { name = "†" }, command = [[\mp]] },

  ["</"] = { context = { name = "</" }, command = [[\langle]] },
  [">/"] = { context = { name = "</" }, command = [[\rangle]] },
}

local snippets = {}
for k, v in pairs(symbol_specs) do
  table.insert(
    snippets,
    symbol_snippet(vim.tbl_deep_extend("keep", { trig = k }, v.context), v.command, { condition = tex.in_math })
  )
end

return snippets
