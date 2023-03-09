local hadSuccess, LazyPlugins = pcall(require, "lazy")
if not hadSuccess then
  return
end

LazyPlugins.setup({
  "wbthomason/packer.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-lua/plenary.nvim",

  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  },

  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    config = function()
      require("ColorSchemes.GitHub")
    end,
  },
  {
    "sainnhe/everforest",
    config = function()
      require("ColorSchemes.Everforest")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      require("ColorSchemes.GruvBox")
    end,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("ColorSchemes.OneDark")
    end,
  },

  "nvim-lualine/lualine.nvim",
  "stevearc/dressing.nvim",
  {
    "glepnir/dashboard-nvim",
    commit = "e517188dab55493fb9034b4d4f1a508ccacfcd45",
  },
  "lukas-reineke/indent-blankline.nvim",

  "nvim-tree/nvim-tree.lua",
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "onsails/lspkind-nvim",
      "ray-x/lsp_signature.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "j-hui/fidget.nvim",
      "jose-elias-alvarez/typescript.nvim",
      "simrat39/rust-tools.nvim",
      {
        "mfussenegger/nvim-jdtls",
        ft = "java",
      },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-path",
      "f3fora/cmp-spell",
      "saadparwaiz1/cmp_luasnip",
      "lukas-reineke/cmp-under-comparator",
    },
  },

  "lewis6991/gitsigns.nvim",
  "f-person/git-blame.nvim",

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = "markdown",
  },

  "andweeb/presence.nvim",

  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "NvChad/nvim-colorizer.lua",

  "numToStr/Comment.nvim",
  "folke/todo-comments.nvim",
})
