local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "-",
    rhs = ":Oil --float<CR>",
    description = "Open parent directory - Float.",
  },
  {
    mode = { "n" },
    lhs = "_",
    rhs = ":Oil<CR>",
    description = "Open parent directory - Window.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Oil: " })

return M
