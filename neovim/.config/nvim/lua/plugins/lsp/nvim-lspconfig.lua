return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local servers = require("utils.api").servers
    local settings = require("utils.api").settings
    local icons = require("utils.interface").icons

    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      local api = require("utils.api")

      api.mappings.bulk_register({
        {
          mode = { "n", "v" },
          lhs = "<leader>la",
          rhs = vim.lsp.buf.code_action,
          options = opts,
          description = "Show code actions.",
        },
        {
          mode = { "n" },
          lhs = "<leader>rn",
          rhs = vim.lsp.buf.rename,
          options = opts,
          description = "Rename symbol under cursor.",
        },
        {
          mode = { "n" },
          lhs = "<leader>lf",
          rhs = function()
            vim.lsp.buf.format({ async = true })
          end,
          options = opts,
          description = "Format current buffer.",
        },
        {
          mode = { "n" },
          lhs = "K",
          rhs = vim.lsp.buf.hover,
          options = opts,
          description = "Show help information.",
        },
        {
          mode = { "n" },
          lhs = "gr",
          rhs = function()
            require("telescope.builtin").lsp_references()
          end,
          options = opts,
          description = "Go to references.",
        },
        {
          mode = { "n" },
          lhs = "gi",
          rhs = function()
            require("telescope.builtin").lsp_implementations()
          end,
          options = opts,

          description = "Go to implementations.",
        },
        {
          mode = { "n" },
          lhs = "gd",
          rhs = function()
            require("telescope.builtin").lsp_definitions()
          end,
          options = opts,
          description = "Go to definitions.",
        },
        {
          mode = { "n" },
          lhs = "gD",
          rhs = function()
            require("telescope.builtin").lsp_type_definitions()
          end,
          options = opts,
          description = "Go to type definitions.",
        },
        {
          mode = { "n" },
          lhs = "of",
          rhs = vim.diagnostic.open_float,
          options = opts,
          description = "Show current line diagnostic..",
        },
        {
          mode = { "n" },
          lhs = "<leader>ld",
          rhs = function()
            require("telescope.builtin").diagnostics()
          end,
          options = opts,
          description = "Show project diagnostics.",
        },
        {
          mode = { "n" },
          lhs = "[d",
          rhs = vim.diagnostic.goto_prev,
          options = opts,
          description = "Jump to previous diagnostic.",
        },
        {
          mode = { "n" },
          lhs = "]d",
          rhs = vim.diagnostic.goto_next,
          options = opts,
          description = "Jump to next diagnostic.",
        },
      })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = {
      Error = icons.diagnostics.BoldError,
      Warn = icons.diagnostics.BoldWarning,
      Hint = icons.diagnostics.BoldHint,
      Info = icons.diagnostics.BoldInformation,
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      underline = true,
      virtual_text = settings.get_settings("format_on_save"),
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

    for _, server in pairs(servers.lsp) do
      local has_extras, extras = pcall(require, "plugins.lsp.extras." .. server)

      if server == "jdtls" then
        goto continue
      end

      if has_extras then
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
