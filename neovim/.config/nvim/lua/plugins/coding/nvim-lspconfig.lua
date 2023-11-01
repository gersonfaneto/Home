return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local base = require("utils.base")
    local types = require("utils.types")
    local interface = require("utils.interface")

    local icons = interface.get_icons("diagnostics")

    local on_attach = function(_, bufnr)
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
          lhs = "<leader>rn",
          rhs = ":Lspsaga rename<CR>",
          options = opts,
          description = "Rename symbol under cursor.",
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
          rhs = ":Lspsaga show_line_diagnostics<CR>",
          options = opts,
          description = "Show current line diagnostics.",
        },
        {
          mode = { "n" },
          lhs = "<leader>cd",
          rhs = ":Lspsaga show_cursor_diagnostics<CR>",
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

    local capabilities = cmp_nvim_lsp.default_capabilities()

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
      virtual_text = types.get_settings("virtual_text"),
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

    for _, server in pairs(types.servers.lsp) do
      local has_settings, extras = pcall(require, "plugins.coding.settings." .. server)

      if server == "jdtls" then
        goto continue
      end

      if has_settings then
        lspconfig[server].setup(vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = on_attach,
        }, extras))
      else
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end

      ::continue::
    end
  end,
}
