return {
  "pwntester/octo.nvim",
  event = { "VeryLazy" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local base = require("utils.base")

    local octo = require("octo")

    octo.setup({
      enable_builtin = true,
    })

    vim.cmd([[hi OctoEditable guibg=none]])

    base.mappings.register({
      mode = { "n" },
      lhs = "<leader>O",
      rhs = ":Octo<CR>",
      options = { noremap = true, silent = true },
      description = "Open Octo.",
    })
  end,
}
