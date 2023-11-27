local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<C-f>",
    rhs = ":Neotree toggle float<CR>",
    description = "Toggle float.",
  },
  {
    mode = { "n" },
    lhs = "<C-s>",
    rhs = ":Neotree toggle left<CR>",
    description = "Toggle left.",
  },
}, { options = { silent = true, noremap = true }, prefix = "NeoTree: " })

return M
