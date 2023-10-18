return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    commit = "f2778bd1a28b74adf5b1aa51aa57da85adfa3d16",
    build = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "windwp/nvim-ts-autotag",
      "HiPhish/nvim-ts-rainbow2",
    },
    config = function()
      local treesitter_configs = require("nvim-treesitter.configs")

      treesitter_configs.setup({
        auto_install = true,
        indent = {
          enable = true,
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        rainbow = {
          enable = true,
          disable = {
            "jsx",
            "html",
          },
        },
        autotag = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "css",
          "dart",
          "fish",
          "gitcommit",
          "gitignore",
          "git_rebase",
          "go",
          "html",
          "java",
          "javascript",
          "json",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "ocaml",
          "python",
          "rust",
          "sql",
          "toml",
          "typescript",
        },
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
  },
}
