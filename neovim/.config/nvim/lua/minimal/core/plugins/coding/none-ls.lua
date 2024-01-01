return {
  "nvimtools/none-ls.nvim",
  event = { "VeryLazy" },
  config = function()
    local types = require("minimal.utils.types")
    local plugins = require("minimal.utils.plugins")

    local null_ls = require("null-ls")

    null_ls.setup({
      border = types.settings.transparent_floats and "double" or "none",
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.ocamlformat,

        null_ls.builtins.diagnostics.pylint,
      },
      on_attach = function (client, bufnr)
        plugins.lsp.formatting.on_attach(client, bufnr)
      end
    })
  end,
}
