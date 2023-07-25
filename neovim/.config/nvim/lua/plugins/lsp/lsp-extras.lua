return {
  -- Java.
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    event = "BufReadPre",
  },

  -- Rust.
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    ft = { "rust" },
    config = function()
      require("rust-tools").setup()
    end,
  },
  {
    "saecki/crates.nvim",
    lazy = true,
    enabled = true,
    version = "v0.3.0",
    ft = {
      "rust",
      "toml",
    },
    event = {
      "BufRead",
      "BufReadPre",
      "BufNewFile",
    },
    dependencies = {
      "hrsh7th/nvim-cmp",
      "nvim-lua/plenary.nvim"
    },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
  },

  -- Go.
  {
    "olexsmir/gopher.nvim",
    lazy = false,
    ft = { "go", "gomod" },
    config = function()
      require("gopher").setup({
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "gotests",
          impl = "impl",
          iferr = "iferr",
        },
        goimport = "gopls",
        gofmt = "gopls",
      })
    end
  },
  {
    "ray-x/go.nvim",
    enabled = false,
    ft = { "go", "gomod" },
    event = { "CmdlineEnter" },
    build = function()
      require("go.install").update_all_sync()
    end,
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
  },
}
