return {
  "akinsho/flutter-tools.nvim",
  cmd = {
    "Telescope flutter",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    local flutter_tools = require("flutter-tools")

    local telescope = require("telescope")

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

    telescope.load_extension("flutter")
  end,
}
