return {
  -- Java.
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    event = "BufReadPre",
  },

  -- Dart & Flutter.
  {
    "dart-lang/dart-vim-plugin",
    ft = { "dart" },
    event = "BufReadPre",
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = true,
  }
}
