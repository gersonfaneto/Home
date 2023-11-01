local base = require("utils.base")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "UndoTree: ",
}

local M = {}

base.mappings.register({
  mode = { "n" },
  lhs = "<leader>uu",
  rhs = ":UndotreeToggle<CR>",
  options = props.options,
  description = props.prefix .. "Toggle.",
})

return M
