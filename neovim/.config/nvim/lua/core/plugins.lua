local lazy = require("utils.plugins.lazy")

local M = {}

M.themes = {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 100,
  },
}

M.basics = {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    event = { "VimEnter" },
  },
  {
    "nvim-tree/nvim-web-devicons",
    event = { "VimEnter" },
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "rcarriga/nvim-notify",
    priority = 90,
  },
}

M.lsp = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
    },
  },
  {
    "folke/neodev.nvim",
    lazy = true,
  },
  {
    "j-hui/fidget.nvim",
    event = { "LspAttach" },
    tag = "legacy",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "UIEnter" },
  },
}

M.completion = {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-emoji" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "saadparwaiz1/cmp_luasnip" },
    },
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
      { "rafamadriz/friendly-snippets" },
    },
  },
}

M.editor = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      { "HiPhish/nvim-ts-rainbow2" },
      { "windwp/nvim-ts-autotag" },
      { "nvim-lua/plenary.nvim" },
    },
    event = { "UIEnter" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "UIEnter" },
  },
  {
    "numToStr/Comment.nvim",
    event = { "VeryLazy" },
  },
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
  },
}

M.explorer = {
  {
    "folke/todo-comments.nvim",
    event = { "UIEnter" },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
  },
}

M.languages = {
  {
    "davidgranstrom/nvim-markdown-preview",
    ft = { "markdown" },
  },
  {
    "vim-pandoc/vim-pandoc",
    dependencies = {
      { "vim-pandoc/vim-pandoc-syntax" },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
  },
}

M.tools = {
  {
    "NvChad/nvim-colorizer.lua",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "UIEnter" },
  },
}

M.views = {
  {
    "glepnir/dashboard-nvim",
    commit = "e517188dab55493fb9034b4d4f1a508ccacfcd45",
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    lazy = false,
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
  },
  {
    "stevearc/dressing.nvim",
  },
}

M.grammar = {
  {
    "mateusbraga/vim-spell-pt-br",
  },
}

lazy.entry(M)

return M
