require('filetype').setup {
  overrides = {
    extensions = {
      sequelizerc = "javascript",
      swift = "swift",
      tf = "terraform",
    },
    literal = {
      [".sequelizerc"] = "javascript",
    },
  }
}
