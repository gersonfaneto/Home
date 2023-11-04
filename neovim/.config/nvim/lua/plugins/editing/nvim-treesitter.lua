return {
  "nvim-treesitter/nvim-treesitter",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  commit = "f2778bd1a28b74adf5b1aa51aa57da85adfa3d16",
  build = function()
    pcall(require("nvim-treesitter.install").update({ with_sync = true }))
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local treesitter_configs = require("nvim-treesitter.configs")

    local types = require("utils.types")

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
