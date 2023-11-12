local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>nf",
    rhs = ":Neotree toggle float<CR>",
    description = "Float.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ns",
    rhs = ":Neotree toggle left<CR>",
    description = "Side.",
  },
}, { options = { silent = true, noremap = true }, prefix = "NeoTree: " })

return M
