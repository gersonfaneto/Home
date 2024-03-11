local M = {
  "uga-rosa/ccc.nvim",
  cmd = {
    "CccPick",
    "CccConvert",
    "CccHighlighterToggle",
    "CccHighlighterEnable",
    "CccHighlighterDisable",
  },
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
  {
    mode = { "n" },
    lhs = "<leader>ct",
    rhs = ":CccHighlighterToggle<CR>",
    description = "Toggle Color Highlighter.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cc",
    rhs = ":CccConvert<CR>",
    description = "Convert Color.",
  },
}, { options = { noremap = true, silent = true }, prefix = "CCC :: " })

return M
