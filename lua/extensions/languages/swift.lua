return {
  {
    "keith/swift.vim",
    ft = "swift",
  },
  {
    "tami5/swift.nvim",
    ft = "swift",
    main = "swift_env",
    opts = {
      format = {
        auto = false,
        config_default_content = [[
# see avaliable rules: https://github.com/nicklockwood/SwiftFormat/blob/master/Rules.md

# Format Options
--empty void
--swiftversion 5.4
--indent 2
--indentcase true
--semicolons inline
--shortoptionals always
--stripunusedargs always
--wrapcollections before-first
--wraparguments before-first
--header "\n {file}\n\n Copyright (c) {year} Lazytangent\n\n Created by Lazytangent on {created}.\n"
--tabwidth 2
--self remove

# Rules

--disable linebreakAtEndOfFile
--disable preferKeyPath
--enable redundantParens
--enable redundantLet
--enable redundantNilInit
--disable redundantPattern
--enable redundantReturn
    ]],
      }
    }
  },
}
