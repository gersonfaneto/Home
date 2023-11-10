local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n", "v" },
    lhs = "<leader>rr",
    rhs = [[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]],
    description = "Open.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Refactoring: " })

return M
