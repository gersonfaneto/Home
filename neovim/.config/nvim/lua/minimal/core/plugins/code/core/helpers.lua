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
      null_ls.builtins.diagnostics.ruff,
      null_ls.builtins.diagnostics.mypy,

      -- Lua
      null_ls.builtins.formatting.stylua,

      -- JavaScript | TypeScript | Markdown ...
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
        end,
      }),

      -- PHP
      null_ls.builtins.formatting.pint,

      -- Ruby
      null_ls.builtins.formatting.rubocop,

      -- C | C++
      null_ls.builtins.formatting.clang_format.with({
        filetypes = { "c", "cpp" },
      }),

      -- Java
      null_ls.builtins.formatting.google_java_format.with({
        filetypes = { "java" },
      }),

      -- OCaml
      null_ls.builtins.formatting.ocamlformat,

      -- Git
      null_ls.builtins.code_actions.gitsigns,
    },
    on_attach = function(client, bufnr)
      utils.plugins.lsp.formatting.on_attach(client, bufnr)
    end,
  })
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>tf",
    rhs = utils.plugins.lsp.formatting.toggle,
    description = "Toggle format on save.",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>lf",
    rhs = function()
      vim.lsp.buf.format()
    end,
    description = "Format current buffer.",
  },
}, { options = { silent = true, noremap = true }, prefix = "NoneLS :: " })

return M
