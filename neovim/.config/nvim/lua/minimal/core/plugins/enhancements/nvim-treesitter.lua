return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local configs = require("nvim-treesitter.configs")
    local parsers = require("nvim-treesitter.parsers").get_parser_configs()

    -- BUG: See: https://github.com/nvim-treesitter/nvim-treesitter/issues/4945
    parsers.dart = {
      install_info = {
        url = "https://github.com/UserNobody14/tree-sitter-dart",
        files = { "src/parser.c", "src/scanner.c" },
        revision = "8aa8ab977647da2d4dcfb8c4726341bee26fbce4",
      },
    }

    configs.setup({
      ensure_installed = utils.types.servers.parsers,
      auto_install = true,
      sync_install = false,
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>vv",
          scope_incremental = "*",
          node_incremental = "+",
          node_decremental = "_",
        },
      },
    })
  end,
}
