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
    local configs = require("nvim-treesitter.configs")
    local parsers = require("nvim-treesitter.parsers").get_parser_configs()

    local types = require("minimal.utils.types")

    -- BUG: See: https://github.com/nvim-treesitter/nvim-treesitter/issues/4945
    parsers.dart = {
      install_info = {
        url = "https://github.com/UserNobody14/tree-sitter-dart",
        files = { "src/parser.c", "src/scanner.c" },
        revision = "8aa8ab977647da2d4dcfb8c4726341bee26fbce4",
      },
    }

    configs.setup({
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
