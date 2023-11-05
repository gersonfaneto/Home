local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>xx",
    rhs = ":TroubleToggle<CR>",
    description = "Toggle.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xw",
    rhs = ":TroubleToggle workspace_diagnostics<CR>",
    description = "Browse workspace diagnostics.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xd",
    rhs = ":TroubleToggle document_diagnostics<CR>",
    description = "Browse document diagnostics.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xq",
    rhs = ":TroubleToggle quickfix<CR>",
    description = "Browse quick fix list.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xl",
    rhs = ":TroubleToggle loclist<CR>",
    description = "Browse location list.",
  },
  {
    mode = { "n" },
    lhs = "<leader>xr",
    rhs = ":TroubleToggle lsp_references<CR>",
    description = "Browse LSP references.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Trouble: " })

return M
