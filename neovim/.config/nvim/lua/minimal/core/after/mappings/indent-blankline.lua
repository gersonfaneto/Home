local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>ti",
    rhs = ":IndentBlanklineToggle<CR>",
    description = "Toggle indentation lines.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Indent Blankline: " })

return M
