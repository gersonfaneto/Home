local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>ut",
    rhs = ":UndotreeToggle<CR>",
    description = "Toggle.",
  },
}, { options = { silent = true, noremap = true }, prefix = "UndoTree: " })

return M
