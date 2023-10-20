local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Octo: ",
}

local M = {}

base.mappings.register({
  mode = { "n" },
  lhs = "<leader>O",
  rhs = ":Octo<CR>",
  options = props.options,
  description = props.prefix .. "Open Octo.",
})

return M
