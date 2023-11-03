local base = require("utils.base")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "Oil: ",
}

local M = {}

base.mappings.register({
  mode = { "n" },
  lhs = "^",
  rhs = ":Oil<CR>",
  options = { silent = true, noremap = true },
  description = "Oil - Open parent directory.",
})

return M
