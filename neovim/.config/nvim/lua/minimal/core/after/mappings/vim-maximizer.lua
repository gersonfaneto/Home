local M = {}

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<C-w>m",
    rhs = ":MaximizerToggle<CR>",
    description = "Maximize/Minimize current split.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Maximizer: " })

return M
