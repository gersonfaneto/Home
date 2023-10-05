return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local api = require("utils.api")

    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        css = { "prettier" },
        html = { "prettier" },
        java = { "clang_format" },
        javascript = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        ocaml = { "ocamlformat" },
        python = { "isort", "black" },
        sh = { "shfmt" },
        typescript = { "prettier" },
        yaml = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    api.mappings.register({
      mode = { "n", "v" },
      lhs = "<leader>lf",
      rhs = function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
      options = { noremap = true, silent = true },
      description = "Format current buffer.",
    })
  end,
}
