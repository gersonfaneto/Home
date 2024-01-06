local M = {}

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<BS>",
    rhs = ":Oil<CR>",
    description = "Open parent directory.",
  },
  {
    mode = { "n" },
    lhs = '-',
    rhs = ":Oil --float<CR>",
    description = "Open parent directory - Float.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Oil: " })

return M
