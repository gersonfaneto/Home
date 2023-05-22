local lazy = require("utils.plugins.lazy")

local M = {}

M.themes = {
  {
    "projekt0n/github-nvim-theme",
    tag = "v0.0.7",
    lazy = false,
    priority = 1000,
  },
}

M.basics = {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "nvim-tree/nvim-web-devicons",
    event = { "VimEnter" },
  },
}

M.lsp = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "UIEnter" },
  },
  {
    "folke/neodev.nvim",
    lazy = true,
  },
  {
    "j-hui/fidget.nvim",
    event = { "LspAttach" },
  },
}

M.completion = {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-path" },
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
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      "kkharji/sqlite.lua",
    },
    event = { "VeryLazy" },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
      },
    },
    lazy = true,
  },
}

M.languages = {
  {
    "mfussenegger/nvim-jdtls",
  },
  { 
    "jose-elias-alvarez/typescript.nvim",
  },
  {
    "simrat39/rust-tools.nvim",
  },
  {
    "davidgranstrom/nvim-markdown-preview",
    ft = { "markdown" },
  },
  {
    "manzeloth/live-server",
    ft = { "html" },
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
    event = { "UIEnter" },
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
    "mateusbraga/vim-spell-pt-br" 
  },
}

lazy.entry(M)

return M

