return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local oil = require("oil")

    oil.setup({
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      float = {
        max_height = 20,
        max_width = 60,
      },
    })
  end,
}
