local base = require("utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>ma",
    rhs = ":Alpha<CR>",
    description = "Open Alpha.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Alpha: " })

return M
