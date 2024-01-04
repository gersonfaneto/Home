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
        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- Lua
        null_ls.builtins.formatting.stylua,

        -- JavaScript | TypeScript | Markdown ...
        null_ls.builtins.formatting.prettier,

        -- C | C++
        null_ls.builtins.formatting.clang_format.with({ filetypes = { "c", "cpp" } }),

        -- Java
        null_ls.builtins.formatting.google_java_format.with({ filetypes = { "java" } }),

        -- OCaml
        null_ls.builtins.formatting.ocamlformat,
      },
      on_attach = function(client, bufnr)
        plugins.lsp.formatting.on_attach(client, bufnr)
      end,
    })
  end,
}
