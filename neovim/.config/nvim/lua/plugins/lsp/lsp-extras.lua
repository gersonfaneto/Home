return {
  -- Java.
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    event = "BufReadPre",
  },

  -- Dart.
  {
    "dart-lang/dart-vim-plugin",
    ft = { "dart" },
    event = "BufReadPre",
  },
}
