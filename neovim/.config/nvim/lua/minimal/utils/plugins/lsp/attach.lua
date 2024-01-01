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

  base.mappings.bulk_register({
    {
      mode = { "n", "v" },
      lhs = "<leader>la",
      rhs = vim.lsp.buf.code_action,
      description = "Show code actions.",
    },
    {
      mode = { "n" },
      lhs = "<leader>rn",
      rhs = vim.lsp.buf.rename,
      description = "Rename symbol under cursor.",
    },
    {
      mode = { "n" },
      lhs = "K",
      rhs = vim.lsp.buf.hover,
      description = "Show help information.",
    },
    {
      mode = { "n" },
      lhs = "gr",
      rhs = vim.lsp.buf.references,
      description = "Browse references.",
    },
    {
      mode = { "n" },
      lhs = "gi",
      rhs = vim.lsp.buf.implementation,
      description = "Browse implementations.",
    },
    {
      mode = { "n" },
      lhs = "gd",
      rhs = vim.lsp.buf.definition,
      description = "Jump to definition.",
    },
    {
      mode = { "n" },
      lhs = "sd",
      rhs = ":vsplit | lua vim.lsp.buf.definition()<CR>",
      description = "Split and jump to definition.",
    },
    {
      mode = { "n" },
      lhs = "of",
      rhs = vim.diagnostic.open_float,
      description = "Open diagnostic float.",
    },
    {
      mode = { "n" },
      lhs = "dl",
      rhs = vim.diagnostic.setqflist,
      description = "View diagnostics in quickfix list.",
    },
    {
      mode = { "n" },
      lhs = "[d",
      rhs = vim.diagnostic.goto_prev,
      description = "Jump to previous diagnostic.",
    },
    {
      mode = { "n" },
      lhs = "]d",
      rhs = vim.diagnostic.goto_next,
      description = "Jump to next diagnostic.",
    },
    {
      mode = { "n" },
      lhs = "]d",
      rhs = vim.diagnostic.goto_next,
      description = "Jump to next diagnostic.",
    },
    {
      mode = { "n", "x" },
      lhs = "<leader>lf",
      rhs = function()
        vim.lsp.buf.format({ async = true })
      end,
      description = "Format buffer or selection.",
    },
    {
      mode = { "n" },
      lhs = "<leader>tf",
      rhs = function()
        require("minimal.utils.plugins").lsp.formatting.toggle()
      end,
      description = "Toggle format on save.",
    },
  }, { options = { noremap = true, silent = true, buffer = bufnr }, prefix = "LSP: " })
end

return M
