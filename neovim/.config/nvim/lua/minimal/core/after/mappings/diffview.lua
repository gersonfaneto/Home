local M = {}

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>do",
    rhs = ":DiffviewOpen<CR>",
    description = "Open diff view.",
  },
  {
    mode = { "n" },
    lhs = "<leader>dc",
    rhs = ":DiffviewClose<CR>",
    description = "Close diff view.",
  },
  {
    mode = { "n" },
    lhs = "<leader>dh",
    rhs = ":DiffviewFileHistory<CR>",
    description = "Open diff history.",
  },
  {
    mode = { "n" },
    lhs = "<leader>df",
    rhs = ":DiffviewFileHistory %<CR>",
    description = "Open diff history for current file.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Diffview: " })

return M
