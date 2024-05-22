local base = require("minimal.utils.base")
local types = require("minimal.utils.types")
local interface = require("minimal.utils.interface")

local mappings = require("minimal.utils.plugins.lsp.mappings")

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

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  mappings.register(client, bufnr)
end

return M
