return {
  "nvimtools/none-ls.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local types = require("minimal.utils.types")

    local null_ls = require("null-ls")

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end

    null_ls.setup({
      border = types.settings.transparent_floats and "double" or "none",
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.ocamlformat,

        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.pylint,
      },
      on_attach = types.settings.format_on_save and on_attach or nil,
    })
  end,
}
