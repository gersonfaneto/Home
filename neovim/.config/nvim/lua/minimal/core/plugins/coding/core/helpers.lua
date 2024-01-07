local M = {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
  },
}

function M.config()
  local null_ls = require("null-ls")

  null_ls.setup({
    border = "double",
    sources = {
      -- Python
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,

      -- Lua
      null_ls.builtins.formatting.stylua,

      -- JavaScript | TypeScript | Markdown ...
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
        end,
      }),

      -- C | C++
      null_ls.builtins.formatting.clang_format.with({ filetypes = { "c", "cpp" } }),

      -- Java
      null_ls.builtins.formatting.google_java_format.with({ filetypes = { "java" } }),

      -- OCaml
      null_ls.builtins.formatting.ocamlformat,
    },
    on_attach = function(client, bufnr)
      utils.plugins.lsp.formatting.on_attach(client, bufnr)
    end,
  })
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>nl",
    rhs = ":NullLsInfo<CR>",
    description = "Open NoneLs Info.",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>lf",
    rhs = function()
      vim.lsp.buf.format()
    end,
    description = "Format current buffer.",
  },
}, { options = { silent = true, noremap = true }, prefix = "NoneLS: " })

return M
