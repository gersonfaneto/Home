local base = require("minimal.utils.base")
local types = require("minimal.utils.types")
local interface = require("minimal.utils.interface")

local M = {}

function M.on_attach(_, bufnr)
  local icons = interface.icons.get("diagnostics")

  local signs = {
    Error = icons.BoldError,
    Warn = icons.BoldWarning,
    Hint = icons.BoldHint,
    Info = icons.BoldInformation,
  }

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
      rhs = function()
        require("telescope.builtin").lsp_references()
      end,
      description = "Browse references.",
    },
    {
      mode = { "n" },
      lhs = "gi",
      rhs = function()
        require("telescope.builtin").lsp_implementations()
      end,

      description = "Browse implementations.",
    },
    {
      mode = { "n" },
      lhs = "gd",
      rhs = function()
        require("telescope.builtin").lsp_definitions()
      end,
      description = "Browse definitions.",
    },
    {
      mode = { "n" },
      lhs = "of",
      rhs = vim.diagnostic.open_float,
      description = "Open diagnostics as float.",
    },
    {
      mode = { "n" },
      lhs = "<leader>pd",
      rhs = function()
        require("telescope.builtin").diagnostics()
      end,
      description = "Browse project diagnostics.",
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
  }, { options = { noremap = true, silent = true, buffer = bufnr }, prefix = "LSP: " })
end

return M
