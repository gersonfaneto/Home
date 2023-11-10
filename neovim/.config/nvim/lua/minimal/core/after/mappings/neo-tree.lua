local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>nt",
    rhs = ":Neotree toggle<CR>",
    description = "Toggle.",
  },
  {
    mode = { "n" },
    lhs = "<leader>nf",
    rhs = ":Neotree focus<CR>",
    description = "Focus.",
  },
}, { options = { silent = true, noremap = true }, prefix = "NeoTree: " })

return M
