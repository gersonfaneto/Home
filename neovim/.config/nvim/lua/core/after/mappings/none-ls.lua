local base = require("utils.base")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "NoneLS: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>nl",
    rhs = ":NullLsInfo<CR>",
    options = props.options,
    description = props.prefix .. "Open NoneLs Info.",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>lf",
    rhs = function()
      vim.lsp.buf.format()
    end,
    options = props.options,
    description = props.prefix .. "Format current buffer.",
  },
})

return M
