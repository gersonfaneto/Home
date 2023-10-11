return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local base = require("utils.base")

    local oil = require("oil")

    oil.setup({
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
    })

    base.mappings.register({
      mode = { "n" },
      lhs = "<leader>-",
      rhs = ":Oil<CR>",
      options = { silent = true, noremap = true },
      description = "Oil - Open parent directory.",
    })
  end,
}
