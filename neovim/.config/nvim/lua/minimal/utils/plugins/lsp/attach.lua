local base = require("minimal.utils.base")
local types = require("minimal.utils.types")
local interface = require("minimal.utils.interface")

local M = {}

function M.on_attach(client, bufnr)
  local icons = interface.icons.get("diagnostics")

  local signs = {
    Error = icons.BoldError,
    Warn = icons.BoldWarning,
    Hint = icons.BoldHint,
    Info = icons.BoldInformation,
  }

  bufnr = base.buffers.bufnr(bufnr)

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
      text = icon,
      texthl = hl,
      numhl = "",
    })
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

  local opts = { noremap = true, silent = true, buffer = bufnr }

  local has_support = function()
    local version = vim.version()

    version = version.major .. "." .. version.minor .. "." .. version.patch

    return vim.version.cmp(version, "0.10.0") >= 0
  end

  if client.supports_method("textDocument/inlayHint") and has_support() then
    vim.lsp.inlay_hint.enable(bufnr, true)

    base.mappings.register({
      mode = { "n" },
      lhs = "th",
      rhs = function()
        local current = vim.lsp.inlay_hint.is_enabled(bufnr)

        vim.lsp.inlay_hint.enable(bufnr, not current)
      end,
      options = opts,
      description = "LSP: Toggle inlay hints.",
    })
  end

  local mappings = require("minimal.utils.plugins.lsp.mappings")

  if types.settings.lsp_mappings == "enhanced" then
    mappings.enhanced(bufnr)
  else
    mappings.builtin(bufnr)
  end
end

return M
