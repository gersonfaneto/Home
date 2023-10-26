return {
  "akinsho/flutter-tools.nvim",
  ft = { "dart" },
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = true,
}
