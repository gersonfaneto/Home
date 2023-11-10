local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>lw",
    rhs = ":Lspsaga winbar_toggle<CR>",
    description = "Toggle winbar breadcrumbs.",
  },
  {
    mode = { "n" },
    lhs = "<leader>lt",
    rhs = ":Lspsaga term_toggle<CR>",
    description = "Toggle terminal.",
  },
}, { options = { noremap = true, silent = true }, prefix = "LSP Saga: " })

return M
