local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>tt",
    rhs = ":TodoTelescope<CR>",
    description = "TODOs in current buffer",
  },
  {
    mode = { "n" },
    lhs = "<leader>ta",
    rhs = ":TodoTelescope keywords=TODO,FIX,FIXME<CR>",
    description = "TODOs/FIXs/FIXMEs in current buffer",
  },
}, { options = { noremap = true, silent = true }, prefix = "TODOs: " })

return M
