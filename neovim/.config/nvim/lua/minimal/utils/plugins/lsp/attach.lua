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

  local opts = { noremap = true, silent = true, buffer = bufnr }

  base.mappings.bulk_register({
    {
      mode = { "n", "v" },
      lhs = "<leader>la",
      rhs = ":Lspsaga code_action<CR>",
      options = opts,
      description = "Show code actions.",
    },
    {
      mode = { "n" },
      lhs = "<leader>rf",
      rhs = ":Lspsaga rename<CR>",
      options = opts,
      description = "Rename symbol under cursor - File.",
    },
    {
      mode = { "n" },
      lhs = "<leader>rp",
      rhs = ":Lspsaga rename ++project<CR>",
      options = opts,
      description = "Rename symbol under cursor - Project.",
    },
    {
      mode = { "n" },
      lhs = "K",
      rhs = ":Lspsaga hover_doc<CR>",
      options = opts,
      description = "Show help information.",
    },
    {
      mode = { "n" },
      lhs = "gr",
      rhs = ":Lspsaga finder ref<CR>",
      options = opts,
      description = "Go to references.",
    },
    {
      mode = { "n" },
      lhs = "gi",
      rhs = ":Lspsaga finder imp<CR>",
      options = opts,

      description = "Go to implementations.",
    },
    {
      mode = { "n" },
      lhs = "gd",
      rhs = ":Lspsaga peek_definition<CR>",
      options = opts,
      description = "Peek type definition.",
    },
    {
      mode = { "n" },
      lhs = "gD",
      rhs = ":Lspsaga goto_definition<CR>",
      options = opts,
      description = "Go to type definition.",
    },
    {
      mode = { "n" },
      lhs = "<leader>ld",
      rhs = ":Lspsaga show_line_diagnostics ++unfocus<CR>",
      options = opts,
      description = "Show current line diagnostics.",
    },
    {
      mode = { "n" },
      lhs = "<leader>cd",
      rhs = ":Lspsaga show_cursor_diagnostics ++unfocus<CR>",
      options = opts,
      description = "Show diagnostics under cursor.",
    },
    {
      mode = { "n" },
      lhs = "[d",
      rhs = ":Lspsaga diagnostic_jump_prev<CR>",
      options = opts,
      description = "Jump to previous diagnostic.",
    },
    {
      mode = { "n" },
      lhs = "]d",
      rhs = ":Lspsaga diagnostic_jump_next<CR>",
      options = opts,
      description = "Jump to next diagnostic.",
    },
  })
end

return M
