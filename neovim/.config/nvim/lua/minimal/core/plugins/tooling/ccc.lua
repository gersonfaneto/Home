return {
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
