return {
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
  }
}
