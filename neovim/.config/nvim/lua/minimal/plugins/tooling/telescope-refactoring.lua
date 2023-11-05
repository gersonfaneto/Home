return {
  "ThePrimeagen/refactoring.nvim",
  keys = {
    { "<leader>rr", vim.NIL },
  },
  -- event = {
  --   "BufReadPre",
  --   "BufNewFile",
  -- },
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
