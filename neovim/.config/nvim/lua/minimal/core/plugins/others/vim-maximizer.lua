local M = {
  "szw/vim-maximizer",
  cmd = { "MaximizerToggle" },
}

function M.config() end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<C-w>m",
    rhs = ":MaximizerToggle<CR>",
    description = "Maximize/Minimize current split.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Maximizer :: " })

return M
