return {
  "akinsho/flutter-tools.nvim",
  event = {
    "BufReadPre *.dart",
    "BufNewFile *.dart",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    local flutter_tools = require("flutter-tools")

    flutter_tools.setup({
      lsp = {
        color = {
          enabled = true,
          background = true,
          background_color = { r = 19, g = 17, b = 24 },
          virtual_text = false,
        },
        settings = {
          showTodos = false,
          renameFilesWithClasses = "always",
          updateImportsOnRename = true,
          completeFunctionCalls = true,
          lineLength = 100,
        },
      },
    })
  end,
}
