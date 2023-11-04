local base = require("utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>O",
    rhs = ":Octo<CR>",
    description = "Open.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Octo: " })

return M
