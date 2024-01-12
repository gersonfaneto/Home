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
      rhs = ":Lspsaga code_action<CR>",
      description = "Show code actions.",
    },
    {
      mode = { "n" },
      lhs = "<leader>rn",
      rhs = ":Lspsaga rename<CR>",
      description = "Rename symbol under cursor.",
    },
    {
      mode = { "n" },
      lhs = "K",
      rhs = ":Lspsaga hover_doc<CR>",
      description = "Show help information.",
    },
    {
      mode = { "n" },
      lhs = "gr",
      rhs = ":Lspsaga finder ref<CR>",
      description = "Browse references.",
    },
    {
      mode = { "n" },
      lhs = "gi",
      rhs = ":Lspsaga finder imp<CR>",
      description = "Browse implementations.",
    },
    {
      mode = { "n" },
      lhs = "gd",
      rhs = ":Lspsaga goto_definition<CR>",
      description = "Jump to definition.",
    },
    {
      mode = { "n" },
      lhs = "pd",
      rhs = ":Lspsaga peek_definition<CR>",
      description = "Peek definition.",
    },
    {
      mode = { "n" },
      lhs = "sd",
      rhs = ":vsplit | lua vim.lsp.buf.definition()<CR>",
      description = "Split and jump to definition.",
    },
    {
      mode = { "n" },
      lhs = "cd",
      rhs = ":Lspsaga show_cursor_diagnostics ++unfocus<CR>",
      description = "Show cursor diagnostics.",
    },
    {
      mode = { "n" },
      lhs = "ld",
      rhs = ":Lspsaga show_line_diagnostics ++unfocus<CR>",
      description = "Show line diagnostics.",
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
      rhs = ":Lspsaga diagnostic_jump_next ++unfocus<CR>",
      description = "Jump to previous diagnostic.",
    },
    {
      mode = { "n" },
      lhs = "]d",
      rhs = ":Lspsaga diagnostic_jump_prev ++unfocus<CR>",
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
