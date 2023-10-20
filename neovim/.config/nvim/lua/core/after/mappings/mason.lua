local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Mason: ",
}

local M = {}

base.mappings.register({
  mode = { "n" },
  lhs = "<leader>ms",
  rhs = ":Mason<CR>",
  options = props.options,
  description = props.prefix .. "Open Mason.",
})

return M
