return {
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
