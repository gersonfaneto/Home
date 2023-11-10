return {
  "glepnir/lspsaga.nvim",
  cmd = {
    "Lspsaga",
  },
  event = {
    "LspAttach",
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local lspsaga = require("lspsaga")

    lspsaga.setup({
      move_in_saga = {
        prev = "<C-k>",
        next = "<C-j>",
      },
      finder_action_keys = {
        open = "<CR>",
      },
      definition_action_keys = {
        edit = "<CR>",
      },
      lightbulb = {
        enable = false,
      },
    })
  end,
}