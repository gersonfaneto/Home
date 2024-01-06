local M = {}

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>cp",
    rhs = ":CccPick<CR>",
    description = "Open Color Picker.",
  },
}, { options = { noremap = true, silent = true }, prefix = "CCC: " })

return M
