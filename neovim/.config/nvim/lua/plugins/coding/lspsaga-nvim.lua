return {
  "glepnir/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local base = require("utils.base")

    local lspsaga = require("lspsaga")

    lspsaga.setup({
      symbol_in_winbar = {
        enable = false,
      },
      breadcrumbs = {
        enable = false,
      },
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
    })

    base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>to",
        rhs = ":Lspsaga winbar_toggle<CR>",
        options = { noremap = true, silent = true },
        description = "LSP Saga - Toggle bread crumbs.",
      },
    })
  end,
}
