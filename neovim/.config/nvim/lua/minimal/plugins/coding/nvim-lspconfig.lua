return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lspconfig = require("lspconfig")

    local base = require("minimal.utils.base")
    local types = require("minimal.utils.types")
    local plugins = require("minimal.utils.plugins")
    local interface = require("minimal.utils.interface")

    local icons = interface.icons.get("diagnostics")

    local signs = {
      Error = icons.BoldError,
      Warn = icons.BoldWarning,
      Hint = icons.BoldHint,
      Info = icons.BoldInformation,
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      underline = true,
      virtual_text = types.settings.virtual_text,
      signs = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        source = "always",
        style = "minimal",
        border = "rounded",
        header = "",
        prefix = "",
      },
    })

    local servers = vim.tbl_flatten({
      types.servers.base_languages,
      types.servers.extra_languages,
    })

    local on_attach = plugins.lsp.attach.on_attach()
    local capabilities = plugins.lsp.capabilities.default_capabilities()

    for _, server in pairs(servers) do
      if server == "jdtls" then
        goto continue
      end

      local has_settings, extras = pcall(require, "minimal.plugins.coding.settings." .. server)

      local settings = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      if has_settings then
        settings = base.tables.merge(extras, settings)
      end

      lspconfig[server].setup(settings)

      ::continue::
    end
  end,
}
