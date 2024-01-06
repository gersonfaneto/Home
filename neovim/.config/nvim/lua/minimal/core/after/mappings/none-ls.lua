local M = {}

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
