local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Copilot: ",
}

local M = {}

base.mappings.register({
  mode = { "n" },
  lhs = "<leader>ct",
  rhs = ":Copilot toggle<CR>",
  options = props.options,
  description = props.prefix .. "Toggle Copilot.",
})

return M
