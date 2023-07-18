local mappings = require("utils.api").mappings

local M = {}

mappings.bulk_register({
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

return M
