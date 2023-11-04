local base = require("utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>to",
    rhs = ":Lspsaga winbar_toggle<CR>",
    description = "Toggle bread crumbs.",
  },
}, { options = { noremap = true, silent = true }, prefix = "LSP Saga: " })

return M
