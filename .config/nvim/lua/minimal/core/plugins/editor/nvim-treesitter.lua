local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    {
      "Wansmer/treesj",
      opts = {
        use_default_keymaps = false,
      },
      cmd = {
        "TSJSplit",
        "TSJJoin",
        "TSJToggle",
      },
    },
    {
      "windwp/nvim-ts-autotag",
      opts = {},
      event = {
        "BufReadPre",
        "BufNewFile",
      },
    },
  },
}

function M.init()
  utils.base.mappings.bulk_register({
    {
      mode = { "n", "v" },
      lhs = "<leader>os",
      rhs = ":TSJSplit<CR>",
      description = "Split the object at the current position/selection.",
    },
    {
      mode = { "n", "v" },
      lhs = "<leader>oj",
      rhs = ":TSJJoin<CR>",
      description = "Join the object at the current position/selection.",
    },
    {
      mode = { "n", "v" },
      lhs = "<leader>ot",
      rhs = ":TSJToggle<CR>",
      description = "Split/Join the object at the current position/selection.",
    },
  }, { options = { silent = true, noremap = true }, prefix = "TreeSJ :: " })
end

function M.config()
  local configs = require("nvim-treesitter.configs")

  configs.setup({
    ensure_installed = utils.types.packages.parsers,
    auto_install = true,
    sync_install = false,
    indent = {
      enable = false,
      disable = {},
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
end

return M
