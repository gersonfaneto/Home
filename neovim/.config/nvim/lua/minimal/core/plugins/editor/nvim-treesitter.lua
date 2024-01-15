local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "Wansmer/treesj",
      cmd = {
        "TSJSplit",
        "TSJJoin",
        "TSJToggle",
      },
      opts = {
        use_default_keymaps = false,
      },
    },
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}

function M.config()
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
    autotag = {
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
    textobjects = {
      select = {
        enable = true,
        lookahead = true,

        keymaps = {
          ["af"] = { query = "@function.outer", desc = "Around a function." },
          ["if"] = { query = "@function.inner", desc = "Inner part of a function." },
          -- ["ac"] = { query = "@class.outer", desc = "Around a class." },
          -- ["ic"] = { query = "@class.inner", desc = "Inner part of a class." },
          -- ["ai"] = { query = "@conditional.outer", desc = "Around an if statement." },
          -- ["ii"] = { query = "@conditional.inner", desc = "Inner part of an if statement." },
          -- ["al"] = { query = "@loop.outer", desc = "Around a loop." },
          -- ["il"] = { query = "@loop.inner", desc = "Inner part of a loop." },
          -- ["ap"] = { query = "@parameter.outer", desc = "Around parameter." },
          -- ["ip"] = { query = "@parameter.inner", desc = "Inside a parameter." },
        },
        selection_modes = {
          ["@parameter.outer"] = "v",
          ["@parameter.inner"] = "v",
          ["@function.outer"] = "v",
          ["@conditional.outer"] = "V",
          ["@loop.outer"] = "V",
          ["@class.outer"] = "<C-v>",
        },
        include_surrounding_whitespace = false,
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_previous_start = {
          ["[f"] = { query = "@function.outer", desc = "Previous function." },
          -- ["[c"] = { query = "@class.outer", desc = "Previous class." },
          -- ["[p"] = { query = "@parameter.inner", desc = "Previous parameter." },
        },
        goto_next_start = {
          ["]f"] = { query = "@function.outer", desc = "Next function." },
          -- ["]c"] = { query = "@class.outer", desc = "Next class." },
          -- ["]p"] = { query = "@parameter.inner", desc = "Next parameter." },
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
  })
end

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
}, { options = { silent = true, noremap = true }, prefix = "TreeSJ: " })

return M
