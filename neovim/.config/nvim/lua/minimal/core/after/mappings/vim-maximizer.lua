local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>m",
    rhs = ":MaximizerToggle<CR>",
    description = "Maximize/Minimize current split.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Maximizer: " })

return M
