local M = {}

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "M",
    rhs = ":lua require('mini.starter').open()<CR>",
    description = "Open.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Mini Starter: " })

return M
