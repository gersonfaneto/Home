local api = require("utils.api")

api.maps.bulk_register({
  {
    mode = { "n" },
    lhs = "[z",
    rhs = "zk",
    options = { noremap = true, silent = true },
    description = "Jump to next fold.",
  },
  {
    mode = { "n" },
    lhs = "]z",
    rhs = "zj",
    options = { noremap = true, silent = true },
    description = "Jump to previous fold.",
  },
})
