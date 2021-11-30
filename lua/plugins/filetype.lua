require('filetype').setup {
  overrides = {
    extensions = {
      sequelizerc = "javascript",
      swift = "swift",
    },
    literal = {
      [".sequelizerc"] = "javascript",
    },
  }
}
