local M = {
  "uga-rosa/ccc.nvim",
  cmd = { "CccPick" },
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
      excludes = {
        "lazy",
        "mason",
        "help",
        "neo-tree",
      },
    },
  },
}

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>cp",
    rhs = ":CccPick<CR>",
    description = "Open Color Picker.",
  },
}, { options = { noremap = true, silent = true }, prefix = "CCC: " })

return M
