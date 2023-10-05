return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local api = require("utils.api")

    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        sh = { "shfmt" },
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        java = { "clang_format" },
        ocaml = { "ocamlformat" },
        python = { "isort", "black" },
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        toml = { "prettier" },
        yaml = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
      },
    })

    if api.settings.get_settings("format_on_save") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          conform.format({ bufnr = args.buf })
        end,
      })
    end

    api.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>ci",
        rhs = ":ConformInfo<CR>",
        options = { noremap = true, silent = true },
        description = "Open Conform.",
      },
      {
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
      },
    })
  end,
}
