local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "LSP Saga: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>to",
    rhs = ":Lspsaga winbar_toggle<CR>",
    options = props.options,
    description = props.prefix .. "Toggle bread crumbs.",
  },
})

return M
