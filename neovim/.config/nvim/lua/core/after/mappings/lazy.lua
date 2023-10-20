local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Lazy: ",
}

local M = {}

base.mappings.register({
  mode = { "n" },
  lhs = "<leader>lh",
  rhs = ":Lazy<CR>",
  options = props.options,
  description = props.prefix .. "Open Lazy.",
})

return M
