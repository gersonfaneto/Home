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
  config = function()
    local base = require("utils.base")

    base.mappings.register({
      mode = { "n" },
      lhs = "<leader>fl",
      rhs = ":Telescope flutter commands<CR>",
      options = { noremap = true, silent = true },
      description = "Open Telescope Flutter Commands.",
    })

    return true
  end,
}
