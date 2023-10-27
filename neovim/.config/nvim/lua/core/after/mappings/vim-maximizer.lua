local base = require("utils.base")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "Maximizer: ",
}

local M = {}

base.mappings.register({
  mode = { "n" },
  lhs = "<leader>m",
  rhs = ":MaximizerToggle<CR>",
  options = props.options,
  description = props.prefix .. "Maximize/Minimize current split.",
})

return M
