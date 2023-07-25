return {
  "jose-elias-alvarez/null-ls.nvim",
  lazy = false,
  after = { "lsp-zero.nvim" },
  config = function()
    local settings = require("core.settings")

    local null_ls = require("null-ls")

    null_ls.setup({
      border = settings.float_border and "double" or "none",
      sources = {
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.clang_format,
      },
    })
  end,
}
