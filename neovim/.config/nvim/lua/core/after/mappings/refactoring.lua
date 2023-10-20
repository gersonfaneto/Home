local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Refactoring: ",
}

local M = {}

base.mappings.register({
  mode = { "n", "v" },
  lhs = "<leader>rr",
  rhs = [[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]],
  options = props.options,
  description = props.prefix .. "Refactor.",
})

return M
