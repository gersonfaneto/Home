return {
  "uga-rosa/ccc.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
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
