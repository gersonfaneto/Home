return {
  "ThePrimeagen/refactoring.nvim",
  event = { "VeryLazy" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local refactoring = require("refactoring")

    local telescope = require("telescope")

    refactoring.setup({})

    telescope.load_extension("refactoring")
  end,
}
