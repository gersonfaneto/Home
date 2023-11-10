return {
  "nvim-treesitter/nvim-treesitter",
  event = {
    "VeryLazy",
  },
  build = function()
    vim.api.nvim_command("TSUpdate")
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local treesitter_configs = require("nvim-treesitter.configs")

    local types = require("minimal.utils.types")

    treesitter_configs.setup({
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      auto_install = true,
      ensure_installed = types.servers.parsers,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>vv",
          scope_incremental = false,
          node_incremental = "+",
          node_decremental = "_",
        },
      },
    })
  end,
}
