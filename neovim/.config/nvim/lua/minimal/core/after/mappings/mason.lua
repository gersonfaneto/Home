local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>ms",
    rhs = ":Mason<CR>",
    description = "Open Mason.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Mason: " })

return M