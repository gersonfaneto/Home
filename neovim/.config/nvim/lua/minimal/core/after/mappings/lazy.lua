local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>lh",
    rhs = ":Lazy<CR>",
    description = "Open Lazy.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Lazy: " })

return M
