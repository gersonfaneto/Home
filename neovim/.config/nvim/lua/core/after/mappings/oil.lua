local base = require("utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "^",
    rhs = ":Oil<CR>",
    description = "Open parent directory.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Oil: " })

return M
