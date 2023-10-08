return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    local base = require("utils.base")

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
      ensure_installed = base.servers.lsp,
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = vim.tbl_flatten({
        base.servers.linters,
        base.servers.formatters,
      }),
    })
  end,
}
