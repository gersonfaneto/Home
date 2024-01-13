local M = {
  "tpope/vim-fugitive",
  cmd = "Git",
}

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>gg",
    rhs = ":Git<CR>",
    description = "Open Fugitive.",
  },
}, { prefix = "Fugitive: ", options = { silent = true, noremap = true } })

return M
