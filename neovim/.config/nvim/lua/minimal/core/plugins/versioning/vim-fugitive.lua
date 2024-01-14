local M = {
  "tpope/vim-fugitive",
  cmd = {
    "Git",
    "GBrowse",
  },
  dependencies = {
    "tpope/vim-rhubarb",
  },
}

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>gg",
    rhs = ":Git<CR>",
    description = "Open Fugitive.",
  },
  {
    mode = { "n", "x" },
    lhs = "<leader>gb",
    rhs = ":GBrowse<CR>",
    description = "Open File/Selection in Browser.",
  },
}, { prefix = "Fugitive: ", options = { silent = true, noremap = true } })

return M
