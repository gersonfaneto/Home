return {
  "williamboman/mason.nvim",
  event = {
    "VeryLazy",
  },
  build = function()
    vim.api.nvim_command(":MasonUpdate")
  end,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    local types = require("utils.types")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = types.servers.base_languages,
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = vim.tbl_flatten({
        types.servers.linters,
        types.servers.formatters,
      }),
    })
  end,
}
