local M = {
  "mrcjkb/haskell-tools.nvim",
  ft = {
    "haskell",
    "lhaskell",
    "cabal",
    "cabalproject",
  },
  version = "^3",
}

function M.config()
  vim.g.haskell_tools = {
    hls = {
      on_attach = function(client, bufnr, ht)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        utils.base.mappings.bulk_register({
          {
            mode = { "n" },
            lhs = "<leader>cl",
            rhs = vim.lsp.codelens.run,
            description = "Codelens.",
          },
          {
            mode = { "n" },
            lhs = "<leader>hs",
            rhs = ht.hoogle.hoogle_signature,
            description = "Hoogle Signature.",
          },
          {
            mode = { "n" },
            lhs = "<leader>ea",
            rhs = ht.lsp.buf_eval_all,
            description = "Evaluate Buffer.",
          },
          {
            mode = { "n" },
            lhs = "<leader>rr",
            rhs = ht.repl.toggle,
            description = "Run Repl.",
          },
          {
            mode = { "n" },
            lhs = "<leader>rf",
            rhs = function()
              ht.repl.toggle(vim.api.nvim_buf_get_name(0))
            end,
            description = "Run Repl - File.",
          },
          {
            mode = { "n" },
            lhs = "<leader>rf",
            rhs = ht.repl.quit,
            description = "Quit Repl.",
          },
        }, { prefix = "Haskell :: ", options = opts })

        utils.plugins.lsp.attach.on_attach(client, bufnr)
      end,
    },
  }
end

return M
