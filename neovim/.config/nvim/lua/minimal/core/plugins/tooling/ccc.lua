return {
  "uga-rosa/ccc.nvim",
  event = { "VeryLazy" },
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
