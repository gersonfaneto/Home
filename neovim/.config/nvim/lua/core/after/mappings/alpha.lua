local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Alpha: ",
}

local M = {}

base.mappings.register({
  mode = { "n" },
  lhs = "<leader>ma",
  rhs = ":Alpha<CR>",
  options = props.options,
  description = props.prefix .. "Open Alpha.",
})

return M
