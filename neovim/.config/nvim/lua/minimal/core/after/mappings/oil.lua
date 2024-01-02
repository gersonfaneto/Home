local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "-",
    rhs = ":Oil --float<CR>",
    description = "Open parent directory - Float.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Oil: " })

return M
