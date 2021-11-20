require('filetype').setup {
  overrides = {
    extensions = {
      sequelizerc = "javascript",
    },
    literal = {
      [".sequelizerc"] = "javascript",
    },
  }
}
