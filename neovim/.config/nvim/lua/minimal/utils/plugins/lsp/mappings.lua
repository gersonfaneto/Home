local base = require("minimal.utils.base")

local M = {}

function M.builtin(bufnr)
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
  }, { options = { noremap = true, silent = true, buffer = bufnr }, prefix = "LSP: " })
end

function M.enhanced(bufnr)
  utils.base.mappings.bulk_register({
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
