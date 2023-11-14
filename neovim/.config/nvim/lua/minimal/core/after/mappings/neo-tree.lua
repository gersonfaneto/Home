local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<C-p>",
    rhs = ":Neotree toggle float<CR>",
    description = "Toggle float.",
  },
}, { options = { silent = true, noremap = true }, prefix = "NeoTree: " })

return M
