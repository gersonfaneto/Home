local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Indent Blankline: ",
}

local M = {}

base.mappings.register({
  mode = { "n" },
  lhs = "<leader>ti",
  rhs = ":IndentBlanklineToggle<CR>",
  options = props.options,
  description = props.prefix .. "Toggle indentation lines.",
})

return M
